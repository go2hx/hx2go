package go.net.http;

@:structInit
@:go.Type({ name: "http2errorReader", instanceName: "http.http2errorReader", imports: ["net/http"] })
extern class Http2errorReader {

    @:native("Read") function read(p: go.Slice<go.Byte>): (go.Result<go.GoInt>);

}