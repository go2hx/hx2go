package go.net.http.httptest;

@:structInit
@:go.Type({ name: "ResponseRecorder", instanceName: "httptest.ResponseRecorder", imports: ["net/http/httptest"] })
extern class ResponseRecorder {

    @:native("Code") var code: go.GoInt;
    @:native("HeaderMap") var headerMap: go.net.http.Header;
    @:native("Body") var body: go.Pointer<go.bytes.Buffer>;
    @:native("Flushed") var flushed: Bool;

    function new(code: go.GoInt=0, headerMap: go.net.http.Header=null, body: go.Pointer<go.bytes.Buffer>=null, flushed: Bool=false);

    @:native("Flush") function flush(): Void;
    @:native("Header") function header(): (go.net.http.Header);
    @:native("Result") function result(): (go.Pointer<go.net.http.Response>);
    @:native("Write") function write(buf: go.Slice<go.Byte>): (go.Result<go.GoInt>);
    @:native("WriteHeader") function writeHeader(code: go.GoInt): Void;
    @:native("WriteString") function writeString(str: String): (go.Result<go.GoInt>);

}