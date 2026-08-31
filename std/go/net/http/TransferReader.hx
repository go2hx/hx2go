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

    function new(header: go.net.http.Header=null, statusCode: go.GoInt=0, requestMethod: String="", protoMajor: go.GoInt=0, protoMinor: go.GoInt=0, body: go.io.ReadCloser=null, contentLength: go.Int64=0, chunked: Bool=false, close: Bool=false, trailer: go.net.http.Header=null);

}