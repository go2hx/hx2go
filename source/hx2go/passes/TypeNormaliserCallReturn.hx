package hx2go.passes;

import hx2go.hxb.Typed.HxbTypedExpr;
import hx2go.util.TypeHelper;
import hx2go.util.ExprHelper;

class TypeNormaliserCallReturn extends CompilerPass {

    public function match(expr: HxbTypedExpr): Bool {
        return switch expr.expr {
            case TCall(_): true;
            case _: false;
        }
    }

    public function execute(expr: HxbTypedExpr, frame: ContextFrame): Void {
        switch expr.expr {
            case TCall({ t: TFun(params, ret), expr: f }, args): {
                var ext = FieldAccessExtern.getExternInfo(context, new HxbTypedExpr(f, TFun(params, ret), expr.pos));

                if (!TypeHelper.compare(expr.t, ret)) {
                    if (ext.field?.type != null) {
                        var v = switch ext.field.type {
                            case TFun(_, x): x;
                            case _: ext.field.type;
                        }

                        if (TypeHelper.compare(ret, v)) {
                            // the return type reported is wrong
                            expr.t = ret;
                            return;
                        }
                    }

                    var o = ExprHelper.createCast(expr, ret);
                    expr.expr = o.expr;
                    expr.t = o.t;
                    context.submitNode(expr, true, 1);
                }
            };

            case _: null;
        }
    }

}
