package go.net.http;

@:go.Type({ name: "ResponseWriter", instanceName: "http.ResponseWriter", imports: ["net/http"] })
extern typedef ResponseWriter = {

    @:native("Header") function header(): go.net.http.Header;
    @:native("Write") function write(p0: go.Slice<go.Byte>): go.Result<go.GoInt>;
    @:native("WriteHeader") function writeHeader(statusCode: go.GoInt): Void;

}