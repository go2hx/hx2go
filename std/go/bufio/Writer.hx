package go.bufio;

@:structInit
@:go.Type({ name: "Writer", instanceName: "bufio.Writer", imports: ["bufio"] })
extern class Writer {

    @:native("Available") function available(): (go.GoInt);
    @:native("AvailableBuffer") function availableBuffer(): (go.Slice<go.Byte>);
    @:native("Buffered") function buffered(): (go.GoInt);
    @:native("Flush") function flush(): (go.Error);
    @:native("ReadFrom") function readFrom(r: go.io.Reader): (go.Result<go.Int64>);
    @:native("Reset") function reset(w: go.io.Writer): Void;
    @:native("Size") function size(): (go.GoInt);
    @:native("Write") function write(p: go.Slice<go.Byte>): (go.Result<go.GoInt>);
    @:native("WriteByte") function writeByte(c: go.Byte): (go.Error);
    @:native("WriteRune") function writeRune(r: go.Rune): (go.Result<go.GoInt>);
    @:native("WriteString") function writeString(s: String): (go.Result<go.GoInt>);

}