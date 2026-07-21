package go.bytes;

@:structInit
@:go.Type({ name: "Reader", instanceName: "bytes.Reader", imports: ["bytes"] })
extern class Reader {

    @:native("Len") function len(): (go.GoInt);
    @:native("Read") function read(b: go.Slice<go.Byte>): (go.Result<go.GoInt>);
    @:native("ReadAt") function readAt(b: go.Slice<go.Byte>, off: go.Int64): (go.Result<go.GoInt>);
    @:native("ReadByte") function readByte(): (go.Result<go.Byte>);
    @:go.Tuple("ch", "size", "err") @:native("ReadRune") function readRune(): (go.Tuple<{ ch: go.Rune, size: go.GoInt, err: go.Error }>);
    @:native("Reset") function reset(b: go.Slice<go.Byte>): Void;
    @:native("Seek") function seek(offset: go.Int64, whence: go.GoInt): (go.Result<go.Int64>);
    @:native("Size") function size(): (go.Int64);
    @:native("UnreadByte") function unreadByte(): (go.Error);
    @:native("UnreadRune") function unreadRune(): (go.Error);
    @:native("WriteTo") function writeTo(w: go.io.Writer): (go.Result<go.Int64>);

}