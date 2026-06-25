package hx2go.passes;

import hx2go.hxb.Typed.HxbTypedExpr;
import hx2go.hxb.HxbModuleType;
import hx2go.hxb.Typed.HxbTypedExprDef;
import hx2go.hxb.HxbType;
import hx2go.util.ExprHelper;
import hx2go.util.TypeHelper;

class CastNullableTo extends CompilerPass {

    public function match(expr: HxbTypedExpr): Bool {
        if (expr.t == null) {
            return false;
        }

        return switch [expr.expr, expr.t] {
            case [
                TCast(_, _),
                TAbstract({ name: "Null", pack: [] }, _)
            ]: true;

            case _: false;
        }
    }

    public function execute(expr: HxbTypedExpr, frame: ContextFrame): Void {
        var ot = switch expr.t {
            case TAbstract(_, p): p[0];
            case _: expr.t;
        };

        var eValid = new HxbTypedExpr(
            TConst(TBool(true)),
            TBool,
            null
        );

        var o = switch expr.expr {
            case TCast(e, _): switch e.t {
                case TAbstract({ name: "Null", pack: [] }, _): {
                    var o = ExprHelper.createCast(e, ot);

                    context.submitNode(o, true);
                    ExprHelper.createUntyped('${context.getWriter().types.writeHxbType(expr.t)}{ Value: {0}, Valid: true }', [o]);
                }

                case TDynamic(_) | TDynamicAny: {
                    var o = e;
                    if (!TypeHelper.compare(o.t, ot)) {
                        o = ExprHelper.createCast(o, ot);
                        context.submitNode(o, true);
                    }

                    ExprHelper.createUntyped('${context.getWriter().types.writeHxbType(expr.t)}{ Value: {0}, Valid: {1} != nil }', [o, e]);
                }

                case _: {
                    var o = e;
                    if (!TypeHelper.compare(o.t, ot)) {
                        o = ExprHelper.createCast(o, ot);
                        context.submitNode(o, true);
                    }

                    ExprHelper.createUntyped('${context.getWriter().types.writeHxbType(expr.t)}{ Value: {0}, Valid: true }', [o]);
                }
            }

            case _: expr;
        }

        expr.expr = o.expr;
    }

}