package hx2go.util;

import hx2go.hxb.Typed.HxbTypedExpr;
import hx2go.hxb.Typed.HxbTypedExprDef;
import haxe.runtime.Copy;
import hx2go.hxb.HxbType;
import hx2go.hxb.Typed.HxbModuleTypeRef;

class ExprHelper {

    public static function createUntyped(context: Context, template: String, params: Array<HxbTypedExpr>): HxbTypedExpr {
        var expr = new HxbTypedExpr(
            TCall(
                new HxbTypedExpr(TIdent("__go__"), null, null),
                [
                    new HxbTypedExpr(TConst(TString(template)), null, null)
                ].concat(params)
            ),
            null, null
        );

        context.submitNode(expr, true);

        return expr;
    }

    public static function createCast(context: Context, expr: HxbTypedExpr, type: HxbType): HxbTypedExpr {
        context.desubmitNode(expr, true);

        var castExpr = new HxbTypedExpr(
            TCast(Copy.copy(expr), null),
            type,
            null
        );

        context.submitNode(castExpr, true);

        return castExpr;
    }

}
