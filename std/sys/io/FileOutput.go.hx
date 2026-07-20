package sys.io;

import sys.io.FileSeek;
import go.os.File;
import go.Pointer;
import go.Slice;
import go.Byte;

@:coreApi
class FileOutput extends haxe.io.Output {

    private var __f: Pointer<File>;
    private var __byteBuf: go.Slice<go.Byte>;

    function new(f: Pointer<File>): Void {
        __f = f;
        __byteBuf = [0];
    }

    public override function writeByte(c: Int): Void {
        __byteBuf[0] = cast c;
        try __f.write(__byteBuf).sure() catch (e: Dynamic) throw haxe.io.Error.Custom(e);
    }

    public override function writeBytes(s: haxe.io.Bytes, p: Int, l: Int): Int {
        return try __f.write((cast s.getData().slice(p, p + l) : Pointer<Slice<Byte>>).value).sure() catch (e: Dynamic) throw haxe.io.Error.Custom(e);
    }

    public override function close(): Void {
        super.close();
        try __f.close().sure() catch (e: Dynamic) throw haxe.io.Error.Custom(e);
    }

    public function seek(p: Int, pos: FileSeek):Void {
        try __f.seek(p, pos == SeekBegin ? 0 : pos == SeekCur ? 1 : 2).sure() catch (e: Dynamic) throw haxe.io.Error.Custom(e);
    }

    public function tell(): Int {
        return try __f.seek(0, 1).sure() catch (e: Dynamic) throw haxe.io.Error.Custom(e);
    }

}