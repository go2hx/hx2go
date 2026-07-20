import go.Fmt;
import go.Time;
import go.Os;
import go.haxe.HxArray;
import go.Runtime;
import go.Slice;
import go.Error;
import go.Byte;
import go.Syntax;
import go.Go;
import go.Pointer;
import go.os.exec.ExitError;
import go.os.Exec;

class Sys {

    public static function print(v: Dynamic): Void {
        Fmt.print(Std.string(v));
    }

    public static function println(v: Dynamic): Void {
        Fmt.println(Std.string(v));
    }

    public static function args(): Array<String> {
        var args = [];
        HxArray.setData(args, Os.args);
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
        Time.sleep(seconds * 1000 * Time.Millisecond);
    }

    public static function setTimeLocale(loc: String): Bool {
        var locale = Time.loadLocation(loc);
        if (!locale.isOk()) {
            return false;
        }

        Time.Local = locale.sure();

        return true;
    }

    public static function getCwd(): String {
        return Os.getwd().sure();
    }

    public static function setCwd(s: String): Void {
        Os.chdir(s).sure();
    }

    public static function systemName(): String {
        if (Runtime.GOOS == "windows")
            return "Windows";

        if (Runtime.GOOS == "linux" || Runtime.GOOS == "android")
            return "Linux";

        if (Runtime.GOOS == "freebsd" || Runtime.GOOS == "netbsd" || Runtime.GOOS == "openbsd")
            return "BSD";

        if (Runtime.GOOS == "darwin")
            return "Mac";

        return Runtime.GOOS; // otherwise return the go name
    }

    public static function command(cmd: String, ?args: Array<String>): Int {
        var arg: Slice<String> = args != null ? Slice.fromArray(args) : new Slice();
        var err: Error = null;
        var output: Slice<Byte> = null;

        err.sure();

        Syntax.code('{0}, {1} = exec.Command({2}, {3}...).Output()', output, err, cmd, arg);

        var exitCode: Int = 0;
        var exitError: Pointer<ExitError> = null;
        var ok: Bool = false;

        if (err != null) {
            Syntax.code("{0}, {1} = {2}.(*exec.ExitError)", exitError, ok, err);

            if (ok) {
                Syntax.code("{0} = {1}.ProcessState.ExitCode()", exitCode, exitError);
            } else {
                exitCode = -1; // failed to run
            }
        } else {
            Fmt.println(Go.string(output)); // TODO: pipe output rather than printing at the end
        }

        return 0;
    }

    public static function exit(code: Int): Void {
        Os.exit(code);
    }

    public static function time(): Float {
        var tn = Time.now();
        var sec = tn.unixNano().toFloat() / Time.Second.toFloat();
        var off = tn.local().zone().offset;

        return sec + off.toFloat();
    }

    public static function cpuTime(): Float {
        return Sys.time(); // TODO: impl
    }

    @:deprecated("Use programPath instead") public static function executablePath(): String {
        return Sys.programPath();
    }

    public static function programPath(): String {
        return Os.args[0];
    }

    /*
    public static function environment():Map<String, String>;
    public static function stdin():haxe.io.Input;
    public static function stdout():haxe.io.Output;
    public static function stderr():haxe.io.Output;
    public static function getChar(echo:Bool):Int;
    */

}