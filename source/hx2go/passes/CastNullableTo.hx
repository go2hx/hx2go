package hx2go.passes;

import hx2go.hxb.Typed.HxbTypedExpr;
import hx2go.hxb.HxbModuleType;
import hx2go.hxb.Typed.HxbTypedExprDef;
import hx2go.hxb.HxbType;
import hx2go.util.ExprHelper;
import hx2go.util.TypeHelper;
import hx2go.hxb.Typed.HxbVar;
import hx2go.hxb.Typed.HxbVarKind;

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
            case TAbstract({ name: "Null", pack: [] }, p): p[0];
            case _: return;
        };

        var eValid = new HxbTypedExpr(
            TConst(TBool(true)),
            TBool,
            null
        );

        var o = switch expr.expr {
            case TCast(e, _): switch e.t {
                case TAbstract({ name: "Null", pack: [] }, _): {
                    var tmp = new HxbVar(
                        -1,
                        "hx_nullable",
                        VUser(TVOLocalVariable),
                        0,
                        [],
                        e.pos,
                        e.t
                    );

                    var tmp_ident = new HxbTypedExpr(
                        TLocal(tmp),
                        tmp.type,
                        e.pos
                    );

                    var o = ExprHelper.createCast(tmp_ident, ot);
                    context.submitNode(o, true);

                    new HxbTypedExpr(TBlock([
                        new HxbTypedExpr(TVar(tmp, e), TVoid, e.pos),
                        ExprHelper.createUntyped('${context.getWriter().types.writeHxbType(expr.t)}{ Value: {0}, Valid: {1}.Valid }', [o, tmp_ident])
                    ]), expr.t, expr.pos);
                }

                case TDynamic(_) | TDynamicAny: {
                    var tmp = new HxbVar(
                        -1,
                        "hx_nullable",
                        VUser(TVOLocalVariable),
                        0,
                        [],
                        e.pos,
                        e.t
                    );

                    var tmp_ident = new HxbTypedExpr(
                        TLocal(tmp),
                        tmp.type,
                        e.pos
                    );

                    var o = tmp_ident;
                    if (!TypeHelper.compare(o.t, ot)) {
                        o = ExprHelper.createCast(o, ot);
                        context.submitNode(o, true);
                    }

                    new HxbTypedExpr(TBlock([
                        new HxbTypedExpr(TVar(tmp, e), TVoid, e.pos),
                        new HxbTypedExpr(TIf(
                            new HxbTypedExpr(TBinop(
                                OpEq,
                                tmp_ident,
                                new HxbTypedExpr(TConst(TNull), expr.t, expr.pos)
                            ), TBool, expr.pos),
                            ExprHelper.createUntyped('${context.getWriter().types.writeHxbType(expr.t)}{}', []),
                            ExprHelper.createUntyped('${context.getWriter().types.writeHxbType(expr.t)}{ Value: {0}, Valid: true }', [o])
                        ), expr.t, expr.pos)
                    ]), expr.t, expr.pos);
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