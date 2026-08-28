package go.net.http.httputil;

/**
    ReverseProxy is an HTTP Handler that takes an incoming request and
    sends it to another server, proxying the response back to the
    client.
    
    1xx responses are forwarded to the client if the underlying
    transport supports ClientTrace.Got1xxResponse.
    
    Hop-by-hop headers (see RFC 9110, section 7.6.1), including
    Connection, Proxy-Connection, Keep-Alive, Proxy-Authenticate,
    Proxy-Authorization, TE, Trailer, Transfer-Encoding, and Upgrade,
    are removed from client requests and backend responses.
    The Rewrite function may be used to add hop-by-hop headers to the request,
    and the ModifyResponse function may be used to remove them from the response.
**/
@:structInit
@:go.Type({ name: "ReverseProxy", instanceName: "httputil.ReverseProxy", imports: ["net/http/httputil"] })
extern class ReverseProxy {

    @:native("Rewrite") var rewrite: (p0: go.Pointer<go.net.http.httputil.ProxyRequest>) -> Void;
    @:native("Transport") var transport: go.net.http.RoundTripper;
    @:native("FlushInterval") var flushInterval: go.time.Duration;
    @:native("ErrorLog") var errorLog: go.Pointer<go.log.Logger>;
    @:native("BufferPool") var bufferPool: go.net.http.httputil.BufferPool;
    @:native("ModifyResponse") var modifyResponse: (p0: go.Pointer<go.net.http.Response>) -> (go.Error);
    @:native("ErrorHandler") var errorHandler: (p0: go.net.http.ResponseWriter, p1: go.Pointer<go.net.http.Request>, p2: go.Error) -> Void;
    @:native("Director") var director: (p0: go.Pointer<go.net.http.Request>) -> Void;

    function new(rewrite: (p0: go.Pointer<go.net.http.httputil.ProxyRequest>) -> Void=null, transport: go.net.http.RoundTripper=null, flushInterval: go.time.Duration=cast 0, errorLog: go.Pointer<go.log.Logger>=null, bufferPool: go.net.http.httputil.BufferPool=null, modifyResponse: (p0: go.Pointer<go.net.http.Response>) -> (go.Error)=null, errorHandler: (p0: go.net.http.ResponseWriter, p1: go.Pointer<go.net.http.Request>, p2: go.Error) -> Void=null, director: (p0: go.Pointer<go.net.http.Request>) -> Void=null);

    @:native("ServeHTTP") function serveHTTP(rw: go.net.http.ResponseWriter, req: go.Pointer<go.net.http.Request>): Void;

}