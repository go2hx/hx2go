package hx2go.passes;

import hxb.Typed.HxbTypedExpr;
import hxb.Typed.HxbFieldAccess;
import hx2go.util.ExprHelper;
import hxb.flags.HxbClassFieldFlag;
import hxb.flags.HxbClassFlag;
import hx2go.util.StringConversions;
import hx2go.util.TypeHelper;
import hx2go.normaliser.Semantics;
import hxb.HxbType;
import hx2go.normaliser.ExprCopy;

class FieldAccessArray extends CompilerPass {

    public function match(expr: HxbTypedExpr): Bool {
        return switch expr.expr {
            case TCall({ expr: TField(_, FInstance(_) | FClosureInstance(_)) }, _): true;
            case _: false;
        }
    }

    static function unifyFieldParams(expected: HxbType, actual: HxbType, out: Map<Int, HxbType>): Void {
        switch [expected, actual] {
            case [TTypeParam(TPSField, i), _]:
                out.set(i, actual);

            case [TInst(_, pa), TInst(_, pb)] if (pa.length == pb.length):
                for (i in 0...pa.length) {
                    unifyFieldParams(pa[i], pb[i], out);
                }

            case [TFun(argsA, retA), TFun(argsB, retB)] if (argsA.length == argsB.length):
                for (i in 0...argsA.length) {
                    unifyFieldParams(argsA[i].t, argsB[i].t, out);
                }

                unifyFieldParams(retA, retB, out);

            case _:
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

                var field = cls.fields.filter(f -> f.name == cf.name)[0];
                if (field == null) {
                    return;
                }

                var needsNullCast = switch field.type {
                    case TFun(_, ret) if (TypeHelper.followToDef(context, ret).match(TAbstract({ name: "Null", pack: [] }, _)) && !expr.t.match(TAbstract({ name: "Null", pack: [] }, _))): true;
                    case _: false;
                }

                var name = 'Hx_Array_${StringConversions.toPascalCase(cf.name)}';
                var staticArgs = [e].concat(args);
                var neededParams = params.map(p -> context.getWriter().types.writeHxbType(p));

                if (field.params.length > 0) {
                    var subst = new Map<Int, HxbType>();
                    unifyFieldParams(field.type, funType, subst);

                    for (i in 0...field.params.length) {
                        var t = subst.get(i);
                        if (t != null) {
                            neededParams.push(context.getWriter().types.writeHxbType(t));
                        }
                    }
                }

                expr.expr = ExprHelper.createUntyped('$name${neededParams.length > 0 ? '[${neededParams.join(", ")}]' : ''}(${[for (i in 0...staticArgs.length) i].map(v -> '{$v}').join(", ")})${needsNullCast ? '.Value' : ''}', staticArgs).expr;
            }

            case _: null;
        }

        // TODO: closure capture
    }

}