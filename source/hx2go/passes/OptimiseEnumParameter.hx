package hx2go.passes;

import hxb.Typed.HxbTypedExpr;
import hxb.HxbModuleType;
import hxb.Typed.HxbTypedExprDef;
import hxb.HxbType;
import hx2go.util.ExprHelper;
import haxe.runtime.Copy;
import hx2go.util.StringConversions;
import hx2go.util.StringConversions.StringConversions.typePathClassInstanceName;
import hxb.Typed.HxbFieldAccess;

class OptimiseEnumParameter extends CompilerPass {

    public function match(expr: HxbTypedExpr): Bool {
        return switch expr.expr {
            case TEnumParameter(_): true;
            case _: false;
        }
    }

    public function execute(expr: HxbTypedExpr, frame: ContextFrame): Void {
        switch expr.expr {
            case TEnumParameter(e, ef, index) if (!e.t.match(TDynamic(_) | TDynamicAny)): {
                var enm = switch context.resolve(ef.owner) {
                    case MEnum(e): e;
                    case _: return;
                }

                var ctor = enm.constructors.filter(c -> c.name == ef.name)[0];
                if (ctor == null) {
                    return;
                }

                switch ctor.type {
                    case TFun(params, _):
                        var access = ExprHelper.createUntyped('{0}.(${StringConversions.typePathEnumName(enm.path)}_${ctor.name}).${StringConversions.nameToFieldName(params[index].name)}', [e]);
                        var reconciled = hx2go.util.TypeHelper.reconcile(expr.t, access, params[index].t);
                        expr.expr = (reconciled != null ? reconciled : access).expr;

                    case _: return;
                }
            }

            case _: null;
        }
    }

}