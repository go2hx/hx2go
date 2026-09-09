package sys.net;

import go.bufio.Reader;
import go.Pointer;
import go.Slice;
import go.Byte;

class SocketInput extends haxe.io.Input {

    private var __reader: Pointer<Reader>;

    public function new(reader: Pointer<Reader>): Void {
        __reader = reader;
    }

    public override function readByte(): Int {
        var t = __reader.readByte().tuple();
        if (t.error != null) {
            if (t.error.error() == "EOF") {
                throw new haxe.io.Eof();
            }
            throw haxe.io.Error.Custom(t.error);
        }
        return t.result;
    }

    public override function readBytes(s: haxe.io.Bytes, p: Int, l: Int): Int {
        var buf:Slice<Byte> = s.getData();
        var t = __reader.read(buf.slice(p, p + l)).tuple();
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

}
