package go.net.http;

@:structInit
@:go.Type({ name: "http2noBodyReader", instanceName: "http.http2noBodyReader", imports: ["net/http"] })
extern class Http2noBodyReader {

    @:native("Close") function close(): (go.Error);
    @:native("Read") function read(p0: go.Slice<go.Byte>): (go.Result<go.GoInt>);

}