package go.net.http;

@:structInit
@:go.Type({ name: "transferWriter", instanceName: "http.transferWriter", imports: ["net/http"] })
extern class TransferWriter {

    @:native("Method") var method: String;
    @:native("Body") var body: go.io.Reader;
    @:native("BodyCloser") var bodyCloser: go.io.Closer;
    @:native("ResponseToHEAD") var responseToHEAD: Bool;
    @:native("ContentLength") var contentLength: go.Int64;
    @:native("Close") var close: Bool;
    @:native("TransferEncoding") var transferEncoding: go.Slice<String>;
    @:native("Header") var header: go.net.http.Header;
    @:native("Trailer") var trailer: go.net.http.Header;
    @:native("IsResponse") var isResponse: Bool;
    @:native("FlushHeaders") var flushHeaders: Bool;
    @:native("ByteReadCh") var byteReadCh: go.Chan<go.net.http.ReadResult>;

    function new(method: String, body: go.io.Reader, bodyCloser: go.io.Closer, responseToHEAD: Bool, contentLength: go.Int64, close: Bool, transferEncoding: go.Slice<String>, header: go.net.http.Header, trailer: go.net.http.Header, isResponse: Bool, flushHeaders: Bool, byteReadCh: go.Chan<go.net.http.ReadResult>);

}