package go.compress.gzip;

@:structInit
@:go.Type({ name: "Writer", instanceName: "gzip.Writer", imports: ["compress/gzip"] })
extern class Writer {

    @:native("Header") var header: go.compress.gzip.Header;
    @:native("Comment") var comment: String;
    @:native("Extra") var extra: go.Slice<go.Byte>;
    @:native("ModTime") var modTime: go.time.Time;
    @:native("Name") var name: String;
    @:native("OS") var OS: go.Byte;

    function new(header: go.compress.gzip.Header);

    @:native("Close") function close(): (go.Error);
    @:native("Flush") function flush(): (go.Error);
    @:native("Reset") function reset(w: go.io.Writer): Void;
    @:native("Write") function write(p: go.Slice<go.Byte>): (go.Result<go.GoInt>);

}