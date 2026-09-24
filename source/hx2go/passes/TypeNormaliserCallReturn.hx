package hx2go.passes;

import hxb.Typed.HxbTypedExpr;
import hx2go.util.TypeHelper;
import hx2go.util.ExprHelper;
import hx2go.passes.FieldAccessExtern.ExternKind;

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
                var wanted = expr.t;
                if (!TypeHelper.compare(expr.t, ret)) {
                    if (ext.field?.type != null) {
                        var v = switch ext.field.type {
                            case TFun(_, x): x;
                            case _: ext.field.type;
                        }

                        if (TypeHelper.compare(ret, v)) {
                            if (isNonExternField(ext) && TypeHelper.goEraseType(v).match(TDynamicAny | TDynamic(_))) {
                                var castExpr = TypeHelper.reconcile(wanted, expr, v);
                                if (castExpr != null) {
                                    expr.expr = castExpr.expr;
                                    context.submitNode(expr, true, 1);
                                    return;
                                }
                            }

                            // the return type reported is wrong
                            expr.t = ret;
                            return;
                        }
                    }

                    var o = ExprHelper.createCast(expr, ret);
                    expr.expr = o.expr;
                    expr.t = o.t;
                    context.submitNode(expr, true, 1);
                    return;
                }

                var castExpr = TypeHelper.reconcile(expr.t, expr, declaredReturn(f, ext));
                if (castExpr != null) {
                    expr.expr = castExpr.expr;
                    context.submitNode(expr, true, 1);
                }
            };

            case _: null;
        }
    }

    function isNonExternField(ext: { kind: ExternKind, ?field: hxb.HxbClassField }): Bool {
        return ext != null && ext.field != null && ext.kind.match(ExNone)
            && (ext.field.flags & hxb.flags.HxbClassFieldFlag.CfExtern) == 0;
    }

    function declaredReturn(callee: hxb.Typed.HxbTypedExprDef, ext: { kind: ExternKind, ?field: hxb.HxbClassField }): Null<hxb.HxbType> {
        return switch callee {
            case TLocal({ type: TFun(_, ret) }): ret;
            case _:
                if (isNonExternField(ext)) {
                    switch ext.field.type {
                        case TFun(_, ret): ret;
                        case _: null;
                    }
                } else {
                    null;
                }
        }
    }

}
