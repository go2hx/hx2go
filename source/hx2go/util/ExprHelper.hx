package hx2go.util;

import hx2go.hxb.Typed.HxbTypedExpr;
import hx2go.hxb.Typed.HxbTypedExprDef;

class ExprHelper {

    public static function createUntyped(template: String, params: Array<HxbTypedExpr>): HxbTypedExpr {
        return new HxbTypedExpr(
            TCall(
                new HxbTypedExpr(TIdent("__go__"), null, null),
                [ new HxbTypedExpr(TConst(TString(template)), null, null) ].concat(params)
            ),
            null, null
        );
    }

}
