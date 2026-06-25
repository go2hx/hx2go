package hx2go.passes;

import hx2go.hxb.Typed.HxbTypedExpr;
import hx2go.hxb.HxbModuleType;
import hx2go.hxb.Typed.HxbTypedExprDef;
import hx2go.hxb.HxbType;
import hx2go.util.ExprHelper;
import hx2go.hxb.Typed.HxbVarKind;
import hx2go.hxb.Typed.HxbVar;
import hx2go.util.TypeHelper;

class CastClosure extends CompilerPass {

    public function match(expr: HxbTypedExpr): Bool {
        if (expr.t == null) {
            return false;
        }

        return switch [expr.expr, expr.t] {
            case [
                TCast(_, _),
                TFun(_)
            ]: true;

            case _: false;
        }
    }

    public function execute(expr: HxbTypedExpr, frame: ContextFrame): Void {
        // old[(a, b) -> c] to new[(x, y) -> z]
        /*
        new = func ($1 x, $2 y) z {
            return z(old(a($1), b($2)));
        }
         */

        switch [expr.expr, expr.expr, expr.t] { // get both inner expr ref and type data
            case [TCast({ t: TFun(e_params, e_ret) }, _), TCast(e, _), TFun(params, ret)]: {
                var args: Array<HxbTypedExpr> = [];
                var new_params: Array<HxbVar> = [];

                for (i in 0...params.length) {
                    var new_p = params[i];
                    var old_p = e_params[i];
                    new_p.name = old_p.name;

                    var v: HxbVar = new HxbVar(
                        -1,
                        new_p.name,
                        VUser(TVOArgument),
                        0,
                        [],
                        null,
                        new_p.t
                    );

                    new_params.push(v);

                    var e = new HxbTypedExpr(TLocal(v), v.type, null);

                    if (TypeHelper.compare(new_p.t, old_p.t)) args.push(e)
                    else args.push(ExprHelper.createCast(e, old_p.t));

                    context.submitNode(e, true);
                }

                var e_call = new HxbTypedExpr(TCall(e, args), e_ret, null); // TODO: "e" must be captured;
                if (!TypeHelper.compare(e_ret, ret)) {
                    e_call = new HxbTypedExpr(TCast(e_call, null), ret, null);
                }

                context.submitNode(e_call, true);

                expr.expr = TFunction({
                    args: new_params.map(v -> {
                        v: v,
                        value: null
                    }),
                    expr: new HxbTypedExpr(TBlock([
                        new HxbTypedExpr(TReturn(
                            e_call
                        ), null, null)
                    ]), null, null),
                    t: ret,
                });
            }

            case _: null;
        }
    }

}