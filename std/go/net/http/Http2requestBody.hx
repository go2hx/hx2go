package go.net.http;

@:structInit
@:go.Type({ name: "http2requestBody", instanceName: "http.http2requestBody", imports: ["net/http"] })
extern class Http2requestBody {

    @:native("Close") function close(): (go.Error);
    @:native("Read") function read(p: go.Slice<go.Byte>): (go.Result<go.GoInt>);

}