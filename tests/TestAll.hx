import language.Language;

class TestAll {
    public static var passed = 0;
    public static var failed = 0;
    public static var colorEnabled = haxe.macro.Context.defined("color");

    public static function green(s:String):String return colorEnabled ? '\033[32m$s\033[0m' : s;
    public static function red(s:String):String return colorEnabled ? '\033[31m$s\033[0m' : s;
    public static function cyan(s:String):String return colorEnabled ? '\033[36m$s\033[0m' : s;

    public static function main() {
        Logging.init();

        trace(cyan("=== hx2go Tests ===\n"));
        final pattern = "*";
        MacroTest.runTests(pattern, {
                exprparser.ExprParser.run();
                language.Language.run();
                unit.Unit.run();
                // issues.Issues.run();
        });
        trace("\n=== Results ===");
        trace('Passed: ${green(Std.string(passed))}, Failed: ${red(Std.string(failed))}');
        if (failed == 0) {
            trace(green("ALL PASSED"));
        }else{
            trace(red("SOME FAILED"));
            Sys.exit(1);
        }
    }
}
