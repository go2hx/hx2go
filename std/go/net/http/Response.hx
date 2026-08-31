package go.net.http;

/**
    Response represents the response from an HTTP request.
    
    The [Client] and [Transport] return Responses from servers once
    the response headers have been received. The response body
    is streamed on demand as the Body field is read.
**/
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

    function new(status: String="", statusCode: go.GoInt=0, proto: String="", protoMajor: go.GoInt=0, protoMinor: go.GoInt=0, header: go.net.http.Header=null, body: go.io.ReadCloser=null, contentLength: go.Int64=0, transferEncoding: go.Slice<String>=null, close: Bool=false, uncompressed: Bool=false, trailer: go.net.http.Header=null, request: go.Pointer<go.net.http.Request>=null, TLS: go.Pointer<go.crypto.tls.ConnectionState>=null);

    /**
        Cookies parses and returns the cookies set in the Set-Cookie headers.
    **/
    @:native("Cookies") function cookies(): (go.Slice<go.Pointer<go.net.http.Cookie>>);
    /**
        Location returns the URL of the response's "Location" header,
        if present. Relative redirects are resolved relative to
        [Response.Request]. [ErrNoLocation] is returned if no
        Location header is present.
    **/
    @:native("Location") function location(): (go.Result<go.Pointer<go.net.url.URL>>);
    /**
        ProtoAtLeast reports whether the HTTP protocol used
        in the response is at least major.minor.
    **/
    @:native("ProtoAtLeast") function protoAtLeast(major: go.GoInt, minor: go.GoInt): (Bool);
    /**
        Write writes r to w in the HTTP/1.x server response format,
        including the status line, headers, body, and optional trailer.
        
        This method consults the following fields of the response r:
        
        	StatusCode
        	ProtoMajor
        	ProtoMinor
        	Request.Method
        	TransferEncoding
        	Trailer
        	Body
        	ContentLength
        	Header, values for non-canonical keys will have unpredictable behavior
        
        The Response Body is closed after it is sent.
    **/
    @:native("Write") function write(w: go.io.Writer): (go.Error);

}