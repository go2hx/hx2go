package go.net.http.httputil;

@:structInit
@:go.Type({ name: "noopCloseReader", instanceName: "httputil.noopCloseReader", imports: ["net/http/httputil"] })
extern class NoopCloseReader {

    @:native("Close") function close(): (go.Error);
    @:native("Read") function read(p: go.Slice<go.Byte>): (go.Result<go.GoInt>);

}