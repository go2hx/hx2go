package go.net.http;

@:structInit
@:go.Type({ name: "http2transportResponseBody", instanceName: "http.http2transportResponseBody", imports: ["net/http"] })
extern class Http2transportResponseBody {

    @:native("Close") function close(): (go.Error);
    @:native("Read") function read(p: go.Slice<go.Byte>): (go.Result<go.GoInt>);

}