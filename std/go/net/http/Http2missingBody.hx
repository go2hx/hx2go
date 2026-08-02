package go.net.http;

@:structInit
@:go.Type({ name: "http2missingBody", instanceName: "http.http2missingBody", imports: ["net/http"] })
extern class Http2missingBody {

    @:native("Close") function close(): (go.Error);
    @:native("Read") function read(p0: go.Slice<go.Byte>): (go.Result<go.GoInt>);

}