package go.compress.flate;

@:structInit
@:go.Type({ name: "decompressor", instanceName: "flate.decompressor", imports: ["compress/flate"] })
extern class Decompressor {

    @:native("Close") function close(): (go.Error);
    @:native("Read") function read(b: go.Slice<go.Byte>): (go.Result<go.GoInt>);
    @:native("Reset") function reset(r: go.io.Reader, dict: go.Slice<go.Byte>): (go.Error);

}