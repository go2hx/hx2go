package go.net.http.cgi;

@:structInit
@:go.Type({ name: "response", instanceName: "cgi.response", imports: ["net/http/cgi"] })
extern class Response {

    @:native("Flush") function flush(): Void;
    @:native("Header") function header(): (go.net.http.Header);
    @:native("Write") function write(p: go.Slice<go.Byte>): (go.Result<go.GoInt>);
    @:native("WriteHeader") function writeHeader(code: go.GoInt): Void;

}