package go.compress.zlib;

@:structInit
@:go.Type({ name: "Writer", instanceName: "zlib.Writer", imports: ["compress/zlib"] })
extern class Writer {

    @:native("Close") function close(): go.Error;
    @:native("Flush") function flush(): go.Error;
    @:native("Reset") function reset(w: go.io.Writer): Void;
    @:native("Write") function write(p: go.Slice<go.Byte>): go.Result<go.GoInt>;

}