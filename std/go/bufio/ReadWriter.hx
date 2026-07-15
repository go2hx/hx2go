package go.bufio;

@:structInit
@:go.Type({ name: "ReadWriter", instanceName: "bufio.ReadWriter", imports: ["bufio"] })
extern class ReadWriter {

    @:native("Reader") var reader: go.Pointer<go.bufio.Reader>;
    @:native("Writer") var writer: go.Pointer<go.bufio.Writer>;

function new(reader: go.Pointer<go.bufio.Reader>, writer: go.Pointer<go.bufio.Writer>);

    @:native("Available") function available(): go.GoInt;
    @:native("AvailableBuffer") function availableBuffer(): go.Slice<go.Byte>;
    @:native("Discard") function discard(n: go.GoInt): go.Result<go.GoInt>;
    @:native("Flush") function flush(): go.Error;
    @:native("Peek") function peek(n: go.GoInt): go.Result<go.Slice<go.Byte>>;
    @:native("Read") function read(p: go.Slice<go.Byte>): go.Result<go.GoInt>;
    @:native("ReadByte") function readByte(): go.Result<go.Byte>;
    @:native("ReadBytes") function readBytes(delim: go.Byte): go.Result<go.Slice<go.Byte>>;
    @:native("ReadFrom") function readFrom(r: go.io.Reader): go.Result<go.Int64>;
    @:go.Tuple("line", "isPrefix", "err") @:native("ReadLine") function readLine(): go.Tuple<{ line: go.Slice<go.Byte>, isPrefix: Bool, err: go.Error }>;
    @:go.Tuple("r", "size", "err") @:native("ReadRune") function readRune(): go.Tuple<{ r: go.Rune, size: go.GoInt, err: go.Error }>;
    @:native("ReadSlice") function readSlice(delim: go.Byte): go.Result<go.Slice<go.Byte>>;
    @:native("ReadString") function readString(delim: go.Byte): go.Result<String>;
    @:native("UnreadByte") function unreadByte(): go.Error;
    @:native("UnreadRune") function unreadRune(): go.Error;
    @:native("Write") function write(p: go.Slice<go.Byte>): go.Result<go.GoInt>;
    @:native("WriteByte") function writeByte(c: go.Byte): go.Error;
    @:native("WriteRune") function writeRune(r: go.Rune): go.Result<go.GoInt>;
    @:native("WriteString") function writeString(s: String): go.Result<go.GoInt>;
    @:native("WriteTo") function writeTo(w: go.io.Writer): go.Result<go.Int64>;

}