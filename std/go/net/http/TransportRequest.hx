package go.net.http;

@:structInit
@:go.Type({ name: "transportRequest", instanceName: "http.transportRequest", imports: ["net/http"] })
extern class TransportRequest {

    @:native("Request") var request: go.Pointer<go.net.http.Request>;
    @:native("Method") var method: String;
    @:native("URL") var URL: go.Pointer<go.net.url.URL>;
    @:native("Proto") var proto: String;
    @:native("ProtoMajor") var protoMajor: go.GoInt;
    @:native("ProtoMinor") var protoMinor: go.GoInt;
    @:native("Header") var header: go.net.http.Header;
    @:native("Body") var body: go.io.ReadCloser;
    @:native("GetBody") var getBody: () -> (go.Result<go.io.ReadCloser>);
    @:native("ContentLength") var contentLength: go.Int64;
    @:native("TransferEncoding") var transferEncoding: go.Slice<String>;
    @:native("Close") var close: Bool;
    @:native("Host") var host: String;
    @:native("Form") var form: go.net.url.Values;
    @:native("PostForm") var postForm: go.net.url.Values;
    @:native("MultipartForm") var multipartForm: go.Pointer<go.mime.multipart.Form>;
    @:native("Trailer") var trailer: go.net.http.Header;
    @:native("RemoteAddr") var remoteAddr: String;
    @:native("RequestURI") var requestURI: String;
    @:native("TLS") var TLS: go.Pointer<go.crypto.tls.ConnectionState>;
    @:native("Cancel") var cancel: go.Chan<Dynamic>;
    @:native("Response") var response: go.Pointer<go.net.http.Response>;
    @:native("Pattern") var pattern: String;

    function new(request: go.Pointer<go.net.http.Request>);

    @:native("AddCookie") function addCookie(c: go.Pointer<go.net.http.Cookie>): Void;
    @:go.Tuple("username", "password", "ok") @:native("BasicAuth") function basicAuth(): (go.Tuple<{ username: String, password: String, ok: Bool }>);
    @:native("Clone") function clone(ctx: go.context.Context): (go.Pointer<go.net.http.Request>);
    @:native("Context") function context(): (go.context.Context);
    @:native("Cookie") function cookie(name: String): (go.Result<go.Pointer<go.net.http.Cookie>>);
    @:native("Cookies") function cookies(): (go.Slice<go.Pointer<go.net.http.Cookie>>);
    @:native("CookiesNamed") function cookiesNamed(name: String): (go.Slice<go.Pointer<go.net.http.Cookie>>);
    @:go.Tuple("p0", "p1", "p2") @:native("FormFile") function formFile(key: String): (go.Tuple<{ p0: go.mime.multipart.File, p1: go.Pointer<go.mime.multipart.FileHeader>, p2: go.Error }>);
    @:native("FormValue") function formValue(key: String): (String);
    @:native("MultipartReader") function multipartReader(): (go.Result<go.Pointer<go.mime.multipart.Reader>>);
    @:native("ParseForm") function parseForm(): (go.Error);
    @:native("ParseMultipartForm") function parseMultipartForm(maxMemory: go.Int64): (go.Error);
    @:native("PathValue") function pathValue(name: String): (String);
    @:native("PostFormValue") function postFormValue(key: String): (String);
    @:native("ProtoAtLeast") function protoAtLeast(major: go.GoInt, minor: go.GoInt): (Bool);
    @:native("Referer") function referer(): (String);
    @:native("SetBasicAuth") function setBasicAuth(username: String, password: String): Void;
    @:native("SetPathValue") function setPathValue(name: String, value: String): Void;
    @:native("UserAgent") function userAgent(): (String);
    @:native("WithContext") function withContext(ctx: go.context.Context): (go.Pointer<go.net.http.Request>);
    @:native("Write") function write(w: go.io.Writer): (go.Error);
    @:native("WriteProxy") function writeProxy(w: go.io.Writer): (go.Error);

}