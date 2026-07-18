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

    public function new(cmd: String, ?args: Array<String>, ?detached: Bool) {
        var args2: Array<String> = args ?? [];
        proc = Exec.command(cmd, ...args2);
        proc.stdout = cast Os.Stdout;
        proc.stderr = cast Os.Stderr;
        proc.start();
    }

    public function exitCode(block: Bool = true): Int {
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

    public function close(): Void {}

}
