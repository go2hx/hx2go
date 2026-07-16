package hx2go.passes;

import hx2go.hxb.Typed.HxbTypedExpr;
import hx2go.hxb.HxbModuleType;
import hx2go.hxb.Typed.HxbTypedExprDef;
import hx2go.hxb.HxbType;
import hx2go.util.ExprHelper;
import hx2go.util.TypeHelper;
import haxe.runtime.Copy;

class CastPointerInterface extends CompilerPass {

    public function match(expr: HxbTypedExpr): Bool {
        if (expr.t == null) {
            return false;
        }

        return switch expr.expr {
            case TCast({ expr: TCast({ t: TAbstract({ name: "Pointer", pack: ["go"] }, [t1]) }, _), t: t2 }, _) if (TypeHelper.compare(t1, t2) && !TypeHelper.compare(t1, expr.t) && expr.t.match(TType(_))): {
                true;
            }

            case TCast(e, _) if (expr.t.match(TType(_)) && e.t.match(TInst(_))): {
                true;
            }

            case _: false;
        }
    }

    public function execute(expr: HxbTypedExpr, frame: ContextFrame): Void {
        switch expr.expr {
            case TCast({ expr: TCast(inner, _), t: t2 }, _) if (inner.t.match(TAbstract({ name: "Pointer", pack: ["go"] }, _))): {
                var o = ExprHelper.createCast(inner, expr.t);
                expr.expr = o.expr;
                expr.t = o.t;

                context.submitNode(expr, true);
            }

            case TCast(e, _) if (expr.t.match(TType(_)) && e.t.match(TInst(_))): {
                var m = switch expr.t {
                    case TType(tp, _): context.resolve(tp);
                    case _: return;
                }

                if (m == null) {
                    return;
                }

                switch m {
                    case MTypedef(t) if (t.meta.filter(m -> m.name == ":go.Type").length > 0): null;
                    case _: return;
                }

                var o = ExprHelper.createUntyped("(&({0}))", [Copy.copy(e)]);
                e.expr = o.expr;

                context.submitNode(e, true);
            }

            case _: null;
        }
    }

}