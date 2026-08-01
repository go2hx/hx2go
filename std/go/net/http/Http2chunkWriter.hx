package go.net.http;

@:structInit
@:go.Type({ name: "http2chunkWriter", instanceName: "http.http2chunkWriter", imports: ["net/http"] })
extern class Http2chunkWriter {

    @:native("Write") function write(p: go.Slice<go.Byte>): (go.Result<go.GoInt>);

}