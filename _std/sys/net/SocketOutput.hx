package sys.net;

import go.net.TCPConn;
import go.Pointer;
import go.Slice;
import go.Byte;

class SocketOutput extends haxe.io.Output {

    private var __conn: Pointer<TCPConn>;
    private var __byteBuf: Slice<Byte>;

    public function new(conn: Pointer<TCPConn>): Void {
        __conn = conn;
        __byteBuf = [0];
    }

    public override function writeByte(c: Int): Void {
        __byteBuf[0] = cast c;
        try __conn.write(__byteBuf).sure() catch (e: Dynamic) throw haxe.io.Error.Custom(e);
    }

    public override function writeBytes(s: haxe.io.Bytes, p: Int, l: Int): Int {
        return try __conn.write((cast s.getData().slice(p, p + l) : Pointer<Slice<Byte>>).value).sure() catch (e: Dynamic) throw haxe.io.Error.Custom(e);
    }

    public override function close(): Void {
        super.close();
        __conn.close();
    }

}
