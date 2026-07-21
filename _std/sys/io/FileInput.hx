package sys.io;

import sys.io.FileSeek;
import go.os.File;
import go.Pointer;
import go.Slice;
import go.Byte;

@:coreApi
class FileInput extends haxe.io.Input {

    private var __f: Pointer<File>;
    private var __eof: Bool;
    private var __byteBuf: Slice<Byte>;

    function new(f: Pointer<File>): Void {
        __f = f;
        __eof = false;
        __byteBuf = [0];
    }

    public override function readByte(): Int {
        // var t = __f.read(__byteBuf).tuple();
        // if (t.error != null) {
        //     if (t.error.error() == "EOF") {
        //         __eof = true;
        //         throw new haxe.io.Eof();
        //     }

        //     throw haxe.io.Error.Custom(t.error);
        // }

        // return __byteBuf[0];
        return -1;
    }

    public override function readBytes(s: haxe.io.Bytes, p: Int, l: Int): Int {
        // var t = __f.read((cast s.getData() : Pointer<Slice<Byte>>).value).tuple();
        // if (t.error != null) {
        //     if (t.error.error() == "EOF") {
        //         __eof = true;
        //         throw new haxe.io.Eof();
        //     }

        //     throw haxe.io.Error.Custom(t.error);
        // }

        // return t.result;
        return -1;
    }

    public override function close(): Void {
        super.close();
        // __f.close().sure();
    }

    public function seek(p: Int, pos: FileSeek): Void {
        // __f.seek(p, pos == SeekBegin ? 0 : pos == SeekCur ? 1 : 2).sure();
        // __eof = false;
    }

    public function tell(): Int {
        return -1;
        // return __f.seek(0, 1).sure();
    }

    public function eof(): Bool {
        return __eof;
    }

}