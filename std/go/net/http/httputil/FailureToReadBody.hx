package go.net.http.httputil;

@:structInit
@:go.Type({ name: "failureToReadBody", instanceName: "httputil.failureToReadBody", imports: ["net/http/httputil"] })
extern class FailureToReadBody {

    @:native("Close") function close(): (go.Error);
    @:native("Read") function read(p0: go.Slice<go.Byte>): (go.Result<go.GoInt>);

}