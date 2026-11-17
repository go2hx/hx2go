package go.net.http;

@:structInit
@:go.Type({ name: "http2stickyErrWriter", instanceName: "http.http2stickyErrWriter", imports: ["net/http"] })
extern class Http2stickyErrWriter {

    @:native("Write") function write(p: go.Slice<go.Byte>): (go.Result<go.GoInt>);

}