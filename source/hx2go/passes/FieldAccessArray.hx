package hx2go.passes;

import hxb.Typed.HxbTypedExpr;
import hxb.Typed.HxbFieldAccess;
import hx2go.util.ExprHelper;
import hxb.flags.HxbClassFieldFlag;
import hxb.flags.HxbClassFlag;
import hx2go.util.StringConversions;

class FieldAccessArray extends CompilerPass {

    public function match(expr: HxbTypedExpr): Bool {
        return switch expr.expr {
            case TCall({ expr: TField(_, FInstance(_) | FClosureInstance(_)) }, _): true;
            case _: false;
        }
    }

    public function execute(expr: HxbTypedExpr, frame: ContextFrame): Void {
        switch expr.expr {
            case TCall({ t: funType, expr: TField(e, FInstance(tp, params, cf) | FClosureInstance(tp, params, cf))}, args): {
                var mt = context.resolve(tp);
                if (mt == null) {
                    return;
                }

                var cls = switch mt {
                    case MClass(x): x;
                    case _: return;
                }

                if (cls.flags & HxbClassFlag.CExtern == 0) {
                    return;
                }

                var isDyn = switch params[0] {
                    case TDynamic(_) | TTypeParam(_) | TDynamicAny: true;
                    case _: false;
                }

                var name = 'Hx_Array_${StringConversions.toPascalCase(cf.name)}';
                if (isDyn) {
                    name += '_Dyn';
                }

                var staticArgs = [e].concat(args);
                var addDynCast = switch funType {
                    case TFun(params, TInst({ name: "Array", pack: [] }, [TDynamic(_) | TTypeParam(_) | TDynamicAny])): true;
                    case _: false;
                }

                var neededParams = (isDyn ? params.slice(1) : params.copy()).map(p -> context.getWriter().types.writeHxbType(p));
                expr.expr = ExprHelper.createUntyped('$name${neededParams.length > 0 ? '[${neededParams.join(", ")}]' : ''}(${[for (i in 0...staticArgs.length) i].map(v -> '{$v}').join(", ")})${addDynCast ? '.Dyn()' : ''}', staticArgs).expr;
            }

            case _: null;
        }
    }

}