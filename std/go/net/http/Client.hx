package go.net.http;

@:structInit
@:go.Type({ name: "Client", instanceName: "http.Client", imports: ["net/http"] })
extern class Client {

    @:native("Transport") var transport: go.net.http.RoundTripper;
    @:native("CheckRedirect") var checkRedirect: (req: go.Pointer<go.net.http.Request>, via: go.Slice<go.Pointer<go.net.http.Request>>) -> go.Error;
    @:native("Jar") var jar: go.net.http.CookieJar;
    @:native("Timeout") var timeout: go.time.Duration;

function new(transport: go.net.http.RoundTripper, checkRedirect: (req: go.Pointer<go.net.http.Request>, via: go.Slice<go.Pointer<go.net.http.Request>>) -> go.Error, jar: go.net.http.CookieJar, timeout: go.time.Duration);

    @:native("CloseIdleConnections") function closeIdleConnections(): Void;
    @:native("Do") function _do(req: go.Pointer<go.net.http.Request>): go.Result<go.Pointer<go.net.http.Response>>;
    @:native("Get") function get(url: String): go.Result<go.Pointer<go.net.http.Response>>;
    @:native("Head") function head(url: String): go.Result<go.Pointer<go.net.http.Response>>;
    @:native("Post") function post(url: String, contentType: String, body: go.io.Reader): go.Result<go.Pointer<go.net.http.Response>>;
    @:native("PostForm") function postForm(url: String, data: go.net.url.Values): go.Result<go.Pointer<go.net.http.Response>>;

}