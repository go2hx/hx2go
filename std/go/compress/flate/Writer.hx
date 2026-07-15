package go.compress.flate;

@:structInit
@:go.Type({ name: "Writer", instanceName: "flate.Writer", imports: ["compress/flate"] })
extern class Writer {

    @:native("Close") function close(): go.Error;
    @:native("Flush") function flush(): go.Error;
    @:native("Reset") function reset(dst: go.io.Writer): Void;
    @:native("Write") function write(data: go.Slice<go.Byte>): go.Result<go.GoInt>;

}