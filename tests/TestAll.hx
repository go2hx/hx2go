package;
import haxe.PosInfos;

class TestAll {
    public static var passed = 0;
    public static var failed = 0;
    public static var colorEnabled = true;

    public static function green(s:String):String return colorEnabled ? '\033[32m$s\033[0m' : s;
    public static function red(s:String):String return colorEnabled ? '\033[31m$s\033[0m' : s;
    public static function cyan(s:String):String return colorEnabled ? '\033[36m$s\033[0m' : s;
    public static function gray(s:String):String return colorEnabled ? '\033[90m$s\033[0m' : s;

    static function line(tag:String, name:String, pos:PosInfos):String {
        var left = '$tag $name';
        var gap = Std.int(Math.max(2, 100 - left.length));

        var pad = new StringBuf();
        for (i in 0...gap) pad.addChar(" ".code);

        return left + pad.toString() + gray('${pos.fileName}:${pos.lineNumber}');
    }

    public static function logOk(name:String, ?pos:PosInfos):Void {
        passed++;
        Sys.println(line(green("[OK]"), name, pos));
    }

    public static function logFail(name:String, ?pos:PosInfos):Void {
        failed++;
        Sys.println(line(red("[FAIL]"), name, pos));
    }

    public static function main() {
        Sys.println(cyan("=== hx2go Tests ===\n"));
        final pattern = "*";
        MacroTest.runTests(pattern, unit);
        Sys.println("\n=== Results ===");
        Sys.println('Passed: ${green(Std.string(passed))}, Failed: ${red(Std.string(failed))}');
        if (failed == 0) {
            Sys.println(green("ALL PASSED"));
        } else {
            Sys.println(red("SOME FAILED"));
            Sys.exit(1);
        }
    }
}