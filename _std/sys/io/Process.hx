package sys.io;

import go.os.Exec;
import go.os.exec.Cmd;
import go.os.exec.ExitError;
import go.bytes.Buffer;
import go.io.WriteCloser;
import go.Bytes;
import go.Pointer;
import go.Slice;
import go.Byte;
import go.Error;
import go.Syntax;

class Process {

    var proc: Pointer<Cmd>;
    var _exitCode: Int = 0;
    var waited: Bool = false;

    var __out: Pointer<Buffer>;
    var __err: Pointer<Buffer>;

    public var stdout(default, null):haxe.io.Input;
    public var stderr(default, null):haxe.io.Input;
    public var stdin(default, null):haxe.io.Output;

    public function new(cmd: String, ?args: Array<String>, ?detached: Bool) {
        if (args == null) {
            if (go.Runtime.GOOS == "windows")
                proc = Exec.command("cmd", "/C", cmd);
            else
                proc = Exec.command("/bin/sh", "-c", cmd);
        } else {
            proc = Exec.command(cmd, ...args);
        }

        __out = Bytes.newBuffer(null);
        __err = Bytes.newBuffer(null);
        proc.stdout = cast __out;
        proc.stderr = cast __err;
        stdout = new ProcessInput(__out);
        stderr = new ProcessInput(__err);

        var sin: WriteCloser = proc.stdinPipe().sure();
        stdin = new ProcessOutput(sin);

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
        if (proc.process != null)
            proc.process.release();
    }

    public function kill(): Void {
        if (proc.process != null)
            proc.process.kill().sure();
    }

}

private class ProcessInput extends haxe.io.Input {

    var __buf: Pointer<Buffer>;

    public function new(buf: Pointer<Buffer>): Void {
        __buf = buf;
    }

    override function readByte(): Int {
        var one: Slice<Byte> = [0];
        var t = __buf.read(one).tuple();
        if (t.error != null) {
            if (t.error.error() == "EOF") throw new haxe.io.Eof();
            throw haxe.io.Error.Custom(t.error);
        }
        if (t.result == 0) throw new haxe.io.Eof();
        return one[0];
    }

    override function readBytes(s: haxe.io.Bytes, p: Int, l: Int): Int {
        var buf: Slice<Byte> = s.getData();
        var t = __buf.read(buf.slice(p, p + l)).tuple();
        if (t.error != null) {
            if (t.error.error() == "EOF") throw new haxe.io.Eof();
            throw haxe.io.Error.Custom(t.error);
        }
        if (t.result == 0) throw new haxe.io.Eof();
        return t.result;
    }

}

private class ProcessOutput extends haxe.io.Output {

    var __w: WriteCloser;
    var __byteBuf: Slice<Byte>;

    public function new(w: WriteCloser): Void {
        __w = w;
        __byteBuf = [0];
    }

    override function writeByte(c: Int): Void {
        __byteBuf[0] = cast c;
        try __w.write(__byteBuf).sure() catch (e: Dynamic) throw haxe.io.Error.Custom(e);
    }

    override function writeBytes(s: haxe.io.Bytes, p: Int, l: Int): Int {
        var buf: Slice<Byte> = s.getData();
        return try __w.write(buf.slice(p, p + l)).sure() catch (e: Dynamic) throw haxe.io.Error.Custom(e);
    }

    override function close(): Void {
        super.close();
        __w.close();
    }

}
