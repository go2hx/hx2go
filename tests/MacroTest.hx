import haxe.macro.Expr;

class MacroTest {
    public static macro function assert(actual:Expr, expected:Expr):Expr;
    public static macro function runTests(varName:Expr, expr:Expr):Expr;
}