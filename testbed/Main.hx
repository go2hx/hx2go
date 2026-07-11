import hx2go.hxb.Typed.HxbTypedExpr;
import hx2go.hxb.Typed.HxbTypedExprDef;

function main() {
    var x = new HxbTypedExpr(TFunction({
        args: [],
        t: TInt,
        expr: new HxbTypedExpr(TReturn(
            new HxbTypedExpr(TBinop(
                OpAdd,
                new HxbTypedExpr(TConst(TInt(5)), TInt, null),
                new HxbTypedExpr(TConst(TInt(10)), TInt, null)
            ), TInt, null)
        ), TVoid, null)
    }), TFun([], TInt), null);

    switch x.expr {
        case TFunction({ expr: { expr: TReturn(ret) }}) if (ret != null): trace('ret', ret);
        case TFunction({ expr: expr }): trace('expr', expr);
        case TFunction(f): trace('func', f);
        case _: trace('base', x);
    }
}