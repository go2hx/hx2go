package go.compress.zlib;

@:structInit
@:go.Type({ name: "reader", instanceName: "zlib.reader", imports: ["compress/zlib"] })
extern class Reader {

    @:native("Close") function close(): (go.Error);
    @:native("Read") function read(p: go.Slice<go.Byte>): (go.Result<go.GoInt>);
    @:native("Reset") function reset(r: go.io.Reader, dict: go.Slice<go.Byte>): (go.Error);

}