package go.net.http.fcgi;

@:structInit
@:go.Type({ name: "response", instanceName: "fcgi.response", imports: ["net/http/fcgi"] })
extern class Response {

    @:native("Close") function close(): (go.Error);
    @:native("Flush") function flush(): Void;
    @:native("Header") function header(): (go.net.http.Header);
    @:native("Write") function write(p: go.Slice<go.Byte>): (go.Result<go.GoInt>);
    @:native("WriteHeader") function writeHeader(code: go.GoInt): Void;

}