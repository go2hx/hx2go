package go.encoding.json;

@:structInit
@:go.Type({ name: "encodeState", instanceName: "json.encodeState", imports: ["encoding/json"] })
extern class EncodeState {

    @:native("Buffer") var buffer: go.bytes.Buffer;

    function new(buffer: go.bytes.Buffer);

    @:native("Available") function available(): (go.GoInt);
    @:native("AvailableBuffer") function availableBuffer(): (go.Slice<go.Byte>);
    @:native("Bytes") function bytes(): (go.Slice<go.Byte>);
    @:native("Cap") function cap(): (go.GoInt);
    @:native("Grow") function grow(n: go.GoInt): Void;
    @:native("Len") function len(): (go.GoInt);
    @:native("Next") function next(n: go.GoInt): (go.Slice<go.Byte>);
    @:native("Peek") function peek(n: go.GoInt): (go.Result<go.Slice<go.Byte>>);
    @:native("Read") function read(p: go.Slice<go.Byte>): (go.Result<go.GoInt>);
    @:native("ReadByte") function readByte(): (go.Result<go.Byte>);
    @:native("ReadBytes") function readBytes(delim: go.Byte): (go.Result<go.Slice<go.Byte>>);
    @:native("ReadFrom") function readFrom(r: go.io.Reader): (go.Result<go.Int64>);
    @:go.Tuple("r", "size", "err") @:native("ReadRune") function readRune(): (go.Tuple<{ r: go.Rune, size: go.GoInt, err: go.Error }>);
    @:native("ReadString") function readString(delim: go.Byte): (go.Result<String>);
    @:native("Reset") function reset(): Void;
    @:native("String") function string(): (String);
    @:native("Truncate") function truncate(n: go.GoInt): Void;
    @:native("UnreadByte") function unreadByte(): (go.Error);
    @:native("UnreadRune") function unreadRune(): (go.Error);
    @:native("Write") function write(p: go.Slice<go.Byte>): (go.Result<go.GoInt>);
    @:native("WriteByte") function writeByte(c: go.Byte): (go.Error);
    @:native("WriteRune") function writeRune(r: go.Rune): (go.Result<go.GoInt>);
    @:native("WriteString") function writeString(s: String): (go.Result<go.GoInt>);
    @:native("WriteTo") function writeTo(w: go.io.Writer): (go.Result<go.Int64>);

}