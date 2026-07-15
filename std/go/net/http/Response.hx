package go.net.http;

@:structInit
@:go.Type({ name: "Response", instanceName: "http.Response", imports: ["net/http"] })
extern class Response {

    @:native("Status") var status: String;
    @:native("StatusCode") var statusCode: go.GoInt;
    @:native("Proto") var proto: String;
    @:native("ProtoMajor") var protoMajor: go.GoInt;
    @:native("ProtoMinor") var protoMinor: go.GoInt;
    @:native("Header") var header: go.net.http.Header;
    @:native("Body") var body: go.io.ReadCloser;
    @:native("ContentLength") var contentLength: go.Int64;
    @:native("TransferEncoding") var transferEncoding: go.Slice<String>;
    @:native("Close") var close: Bool;
    @:native("Uncompressed") var uncompressed: Bool;
    @:native("Trailer") var trailer: go.net.http.Header;
    @:native("Request") var request: go.Pointer<go.net.http.Request>;
    @:native("TLS") var TLS: go.Pointer<go.crypto.tls.ConnectionState>;

function new(status: String, statusCode: go.GoInt, proto: String, protoMajor: go.GoInt, protoMinor: go.GoInt, header: go.net.http.Header, body: go.io.ReadCloser, contentLength: go.Int64, transferEncoding: go.Slice<String>, close: Bool, uncompressed: Bool, trailer: go.net.http.Header, request: go.Pointer<go.net.http.Request>, TLS: go.Pointer<go.crypto.tls.ConnectionState>);

    @:native("Cookies") function cookies(): go.Slice<go.Pointer<go.net.http.Cookie>>;
    @:native("Location") function location(): go.Result<go.Pointer<go.net.url.URL>>;
    @:native("ProtoAtLeast") function protoAtLeast(major: go.GoInt, minor: go.GoInt): Bool;
    @:native("Write") function write(w: go.io.Writer): go.Error;

}