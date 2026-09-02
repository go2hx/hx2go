package sys.net;

import go.net.TCPConn;
import go.Pointer;
import go.Slice;
import go.Byte;

class SocketInput extends haxe.io.Input {

    private var __conn: Pointer<TCPConn>;
    private var __byteBuf: Slice<Byte>;

    public function new(conn: Pointer<TCPConn>): Void {
        __conn = conn;
        __byteBuf = [0];
    }

    public override function readByte(): Int {
        var t = __conn.read(__byteBuf).tuple();
        if (t.error != null) {
            if (t.error.error() == "EOF") {
                throw new haxe.io.Eof();
            }
            throw haxe.io.Error.Custom(t.error);
        }
        if (t.result == 0) {
            throw new haxe.io.Eof();
        }
        return __byteBuf[0];
    }

    public override function readBytes(s: haxe.io.Bytes, p: Int, l: Int): Int {
        var data:Slice<Byte> = (cast s.getData() : Pointer<Slice<Byte>>).value;
        var t = __conn.read(data.slice(p, p + l)).tuple();
        if (t.error != null) {
            if (t.error.error() == "EOF") {
                throw new haxe.io.Eof();
            }
            throw haxe.io.Error.Custom(t.error);
        }
        if (t.result == 0) {
            throw new haxe.io.Eof();
        }
        return t.result;
    }

    public override function close(): Void {
        __conn.close();
    }

}
