package go.net.http;

@:structInit
@:go.Type({ name: "http2bufferedWriterTimeoutWriter", instanceName: "http.http2bufferedWriterTimeoutWriter", imports: ["net/http"] })
extern class Http2bufferedWriterTimeoutWriter {

    @:native("Write") function write(p: go.Slice<go.Byte>): (go.Result<go.GoInt>);

}