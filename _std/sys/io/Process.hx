package sys.io;

import go.Os;
import go.os.Exec;
import go.os.exec.Cmd;
import go.os.exec.ExitError;
import go.Pointer;
import go.Slice;
import go.Error;
import go.Syntax;

class Process {

    var proc: Pointer<Cmd>;
    var _exitCode: Int = 0;
    var waited: Bool = false;

    // Core sys.io.Process streams. Not yet wired to the go Cmd pipes (stdout/stderr/stdin
    // are currently inherited from the parent process in the constructor below).
    public var stdout(default, null):haxe.io.Input;
    public var stderr(default, null):haxe.io.Input;
    public var stdin(default, null):haxe.io.Output;

    public function new(cmd: String, ?args: Array<String>, ?detached: Bool) {
        var args2: Array<String> = args ?? [];
        proc = Exec.command(cmd, ...args2);
        proc.stdout = cast Os.stdout;
        proc.stderr = cast Os.stderr;
        proc.start();
    }

    public function getPid(): Int {
        return -1; // TODO: expose proc.process.pid
    }

    public function exitCode(block: Bool = true): Null<Int> {
        if (!waited) {
            waited = true;
            var err: Error = proc.wait();
            if (err != null) {
                var ee: Pointer<ExitError> = null;
                var ok: Bool = false;
                Syntax.code("{0}, {1} = {2}.(*exec.ExitError)", ee, ok, err);
                if (ok) {
                    _exitCode = cast ee.exitCode();
                } else {
                    _exitCode = -1;
                }
            }
        }
        return _exitCode;
    }

    public function close(): Void {
        proc.stdout = null;
        proc.stdin = null;
        proc.stderr = null;
        proc.process.release();
    }

    public function kill(): Void {
        proc.process.kill().sure();
    }

}
