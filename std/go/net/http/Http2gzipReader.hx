package go.net.http;

@:structInit
@:go.Type({ name: "http2gzipReader", instanceName: "http.http2gzipReader", imports: ["net/http"] })
extern class Http2gzipReader {

    @:native("Close") function close(): (go.Error);
    @:native("Read") function read(p: go.Slice<go.Byte>): (go.Result<go.GoInt>);

}