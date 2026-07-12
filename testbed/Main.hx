import hx2go.hxb.Typed.HxbTypedExpr;
import hx2go.hxb.Typed.HxbTypedExprDef;
import go.Syntax;

enum Foo {
    A;
    B;
}

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

    switch Syntax.code("{0}", A) {
        case A: trace('A');
        case B: trace('B');
    }

    switch Syntax.code("{0}", B) {
        case A: trace('A');
        case B: trace('B');
    }

    switch Syntax.code("{0}", 10) {
        case 5: trace('5');
        case 10: trace('10');
        case 20 if (Syntax.code("10 < 20")): trace('20 if 10 < 20');
        case 30 if (Syntax.code("10 > 20")): trace('30 if 10 > 20');
        case 30 if (Syntax.code("10 < 20")): trace('30 if 10 < 20');
        case _: trace('default');
    }

    switch Syntax.code("{0}", "Hello, World!") {
        case "Hello, World!": trace('en');
        case "Hola Mundo!": trace('es');
        case "Hallo Wereld!": trace('nl');
        case "Hallo Welt!": trace('de');
        case _: trace('default');
    }
}