package go.bufio;

@:structInit
@:go.Type({ name: "Reader", instanceName: "bufio.Reader", imports: ["bufio"] })
extern class Reader {

    @:native("Buffered") function buffered(): go.GoInt;
    @:native("Discard") function discard(n: go.GoInt): go.Result<go.GoInt>;
    @:native("Peek") function peek(n: go.GoInt): go.Result<go.Slice<go.Byte>>;
    @:native("Read") function read(p: go.Slice<go.Byte>): go.Result<go.GoInt>;
    @:native("ReadByte") function readByte(): go.Result<go.Byte>;
    @:native("ReadBytes") function readBytes(delim: go.Byte): go.Result<go.Slice<go.Byte>>;
    @:go.Tuple("line", "isPrefix", "err") @:native("ReadLine") function readLine(): go.Tuple<{ line: go.Slice<go.Byte>, isPrefix: Bool, err: go.Error }>;
    @:go.Tuple("r", "size", "err") @:native("ReadRune") function readRune(): go.Tuple<{ r: go.Rune, size: go.GoInt, err: go.Error }>;
    @:native("ReadSlice") function readSlice(delim: go.Byte): go.Result<go.Slice<go.Byte>>;
    @:native("ReadString") function readString(delim: go.Byte): go.Result<String>;
    @:native("Reset") function reset(r: go.io.Reader): Void;
    @:native("Size") function size(): go.GoInt;
    @:native("UnreadByte") function unreadByte(): go.Error;
    @:native("UnreadRune") function unreadRune(): go.Error;
    @:native("WriteTo") function writeTo(w: go.io.Writer): go.Result<go.Int64>;

}