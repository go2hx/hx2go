package go.net.http;

@:structInit
@:go.Type({ name: "http2dataBuffer", instanceName: "http.http2dataBuffer", imports: ["net/http"] })
extern class Http2dataBuffer {

    @:native("Len") function len(): (go.GoInt);
    @:native("Read") function read(p: go.Slice<go.Byte>): (go.Result<go.GoInt>);
    @:native("Write") function write(p: go.Slice<go.Byte>): (go.Result<go.GoInt>);

}