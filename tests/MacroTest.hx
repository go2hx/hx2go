import haxe.macro.Expr;

class MacroTest {
    public static macro function assert(comparison:Expr):Expr;
    public static macro function runTests():Expr;
}
