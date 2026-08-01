package go.net.http;

@:structInit
@:go.Type({ name: "gzipReader", instanceName: "http.gzipReader", imports: ["net/http"] })
extern class GzipReader {

    @:native("Close") function close(): (go.Error);
    @:native("Read") function read(p: go.Slice<go.Byte>): (go.Result<go.GoInt>);

}