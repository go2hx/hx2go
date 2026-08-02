import go.Time_ as Time;
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
import sys.io.FileOutput;
import sys.io.FileInput;
import go.Syscall;
import go.golang_org.x.Term;

class Sys {

    public static function print(v: Dynamic): Void {
        Os.stdout.writeString(Std.string(v));
    }

    public static function println(v: Dynamic): Void {
        Os.stdout.writeString(Std.string(v) + "\n");
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
        Time.sleep(cast (seconds * 1000 * cast(Time.Millisecond, Float)));
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

    public static function systemName(): String {
        return switch Runtime.GOOS {
            case "windows":
                "Windows";
            case "linux", "android":
                "Linux";
            case "freebsd", "netbsd", "openbsd":
                "BSD";
            case "darwin":
                "Mac";
            default:
                Runtime.GOOS;
        }
    }

    @:analyzer(no_user_var_fusion)
    @:analyzer(no_const_propagation)
    public static function command(cmd: String, args: Array<String>=null): Int {
        if (args == null)
            args = [];
        var res = Exec.command(cmd, ...args).output();
        var t = res.tuple();
        var output: Slice<Byte> = t.result;
        var err: Error = t.error;

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
            Sys.println(Go.string(output)); // TODO: pipe output rather than printing at the end
        }

        return 0;
    }

    public static function exit(code: Int): Void {
        Os.exit(code);
    }

    public static function time(): Float {
        var tn = Time.now();
        var sec = tn.unixNano().toFloat() / cast(Time.Second, Float);
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

    public static function environment(): Map<String, String> {
        var em: Map<String, String> = [];
        var ev: Slice<String> = Os.environ();

        for (entry in ev) {
            var parts: Array<String> = entry.split("=");
            var name: String = parts.shift();
            var value: String = parts.join("=");
            em[name] = value;
        }

        return em;
    }

    @:access(sys.io.FileInput)
    public static function stdin(): haxe.io.Input {
        return new FileInput(Os.stdin);
    }

    @:access(sys.io.FileOutput)
    public static function stdout(): haxe.io.Output {
        return new FileOutput(Os.stdout);
    }

    @:access(sys.io.FileOutput)
    public static function stderr(): haxe.io.Output {
        return new FileOutput(Os.stderr);
    }

    public static function getChar(echo: Bool): Int {
        // raw mode
        var oldState = Term.makeRaw(Go.int(Os.stdin.fd())).sure();
        // restore to previous mode
        Syntax.defer(() -> Term.restore(Go.int(Os.stdin.fd()), oldState));
        // read byte
        var b = new Slice<Byte>(1);
        Os.stdin.read(b).sure();
        
        if (echo) {
            Sys.println(String.fromCharCode(b[0]));
        }
        return b[0];
    }

}