package go.net.http.fcgi;

@:structInit
@:go.Type({ name: "bufWriter", instanceName: "fcgi.bufWriter", imports: ["net/http/fcgi"] })
extern class BufWriter {

    @:native("Writer") var writer: go.Pointer<go.bufio.Writer>;

    function new(writer: go.Pointer<go.bufio.Writer>=null);

    @:native("Available") function available(): (go.GoInt);
    @:native("AvailableBuffer") function availableBuffer(): (go.Slice<go.Byte>);
    @:native("Buffered") function buffered(): (go.GoInt);
    @:native("Close") function close(): (go.Error);
    @:native("Flush") function flush(): (go.Error);
    @:native("ReadFrom") function readFrom(r: go.io.Reader): (go.Result<go.Int64>);
    @:native("Reset") function reset(w: go.io.Writer): Void;
    @:native("Size") function size(): (go.GoInt);
    @:native("Write") function write(p: go.Slice<go.Byte>): (go.Result<go.GoInt>);
    @:native("WriteByte") function writeByte(c: go.Byte): (go.Error);
    @:native("WriteRune") function writeRune(r: go.Rune): (go.Result<go.GoInt>);
    @:native("WriteString") function writeString(s: String): (go.Result<go.GoInt>);

}