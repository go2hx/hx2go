import go.fmt.Fmt;
import go.time.Time;
import go.os.Os;
import go.hx2go.HxArray;

class Sys {

    public static function print(v: Dynamic): Void {
        Fmt.print(Std.string(v));
    }

    public static function println(v: Dynamic): Void {
        Fmt.println(Std.string(v));
    }

    public static function args(): Array<String> {
        var args = [];
        HxArray.setData(args, Os.Args);
        HxArray.shift(args);

        return args;
    }

    public static function getEnv(s: String): String {
        return Os.getenv(s);
    }

    public static function putEnv(s: String, v: Null<String>): Void {
        if (v == null) Os.unsetenv(s).sure();
        else Os.setenv(s, v).sure();
    }

    public static function sleep(seconds: Float): Void {
        Time.sleep(seconds * 1000 * Time.millisecond);
    }

    public static function setTimeLocale(loc: String): Bool {
        var locale = Time.loadLocation(loc);
        if (!locale.isOk()) {
            return false;
        }

        Time.local = locale.sure();

        return true;
    }

    public static function getCwd(): String {
        return Os.getwd().sure();
    }

    public static function setCwd(s: String): Void {
        Os.chdir(s).sure();
    }
//    public static function systemName():String;
//    public static function command(cmd:String, ?args:Array<String>):Int;
//    public static function exit(code:Int):Void;

    public static function time(): Float {
        return Time.now().unixNano() / Time.second;
    }

//    public static function cpuTime():Float;
//    @:deprecated("Use programPath instead") public static function executablePath():String;
//    public static function programPath():String;
//    public static function getChar(echo:Bool):Int;

    /*
    public static function environment():Map<String, String>;
    public static function stdin():haxe.io.Input;
    public static function stdout():haxe.io.Output;
    public static function stderr():haxe.io.Output;
     */

}