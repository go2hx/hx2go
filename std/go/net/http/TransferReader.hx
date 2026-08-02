package go.net.http;

@:structInit
@:go.Type({ name: "transferReader", instanceName: "http.transferReader", imports: ["net/http"] })
extern class TransferReader {

    @:native("Header") var header: go.net.http.Header;
    @:native("StatusCode") var statusCode: go.GoInt;
    @:native("RequestMethod") var requestMethod: String;
    @:native("ProtoMajor") var protoMajor: go.GoInt;
    @:native("ProtoMinor") var protoMinor: go.GoInt;
    @:native("Body") var body: go.io.ReadCloser;
    @:native("ContentLength") var contentLength: go.Int64;
    @:native("Chunked") var chunked: Bool;
    @:native("Close") var close: Bool;
    @:native("Trailer") var trailer: go.net.http.Header;

    function new(header: go.net.http.Header, statusCode: go.GoInt, requestMethod: String, protoMajor: go.GoInt, protoMinor: go.GoInt, body: go.io.ReadCloser, contentLength: go.Int64, chunked: Bool, close: Bool, trailer: go.net.http.Header);

}