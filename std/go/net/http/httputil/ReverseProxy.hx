package go.net.http.httputil;

@:structInit
@:go.Type({ name: "ReverseProxy", instanceName: "httputil.ReverseProxy", imports: ["net/http/httputil"] })
extern class ReverseProxy {

    @:native("Rewrite") var rewrite: (p0: go.Pointer<go.net.http.httputil.ProxyRequest>) -> Void;
    @:native("Transport") var transport: go.net.http.RoundTripper;
    @:native("FlushInterval") var flushInterval: go.time.Duration;
    @:native("ErrorLog") var errorLog: go.Pointer<go.log.Logger>;
    @:native("BufferPool") var bufferPool: go.net.http.httputil.BufferPool;
    @:native("ModifyResponse") var modifyResponse: (p0: go.Pointer<go.net.http.Response>) -> go.Error;
    @:native("ErrorHandler") var errorHandler: (p0: go.net.http.ResponseWriter, p1: go.Pointer<go.net.http.Request>, p2: go.Error) -> Void;
    @:native("Director") var director: (p0: go.Pointer<go.net.http.Request>) -> Void;

function new(rewrite: (p0: go.Pointer<go.net.http.httputil.ProxyRequest>) -> Void, transport: go.net.http.RoundTripper, flushInterval: go.time.Duration, errorLog: go.Pointer<go.log.Logger>, bufferPool: go.net.http.httputil.BufferPool, modifyResponse: (p0: go.Pointer<go.net.http.Response>) -> go.Error, errorHandler: (p0: go.net.http.ResponseWriter, p1: go.Pointer<go.net.http.Request>, p2: go.Error) -> Void, director: (p0: go.Pointer<go.net.http.Request>) -> Void);

    @:native("ServeHTTP") function serveHTTP(rw: go.net.http.ResponseWriter, req: go.Pointer<go.net.http.Request>): Void;

}