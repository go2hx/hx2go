package go.net.http;

/**
    A ResponseWriter interface is used by an HTTP handler to
    construct an HTTP response.
    
    A ResponseWriter may not be used after [Handler.ServeHTTP] has returned.
**/
@:go.Type({ name: "ResponseWriter", instanceName: "http.ResponseWriter", imports: ["net/http"] })
extern typedef ResponseWriter = {

    @:native("Header") function header(): (go.net.http.Header);
    @:native("Write") function write(p0: go.Slice<go.Byte>): (go.Result<go.GoInt>);
    @:native("WriteHeader") function writeHeader(statusCode: go.GoInt): Void;

}