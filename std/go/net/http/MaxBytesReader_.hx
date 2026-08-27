package go.net.http;

@:structInit
@:go.Type({ name: "maxBytesReader", instanceName: "http.maxBytesReader", imports: ["net/http"] })
extern class MaxBytesReader_ {

    @:native("Close") function close(): (go.Error);
    @:native("Read") function read(p: go.Slice<go.Byte>): (go.Result<go.GoInt>);

}