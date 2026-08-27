package go.net.http;

@:structInit
@:go.Type({ name: "Transport", instanceName: "http.Transport", imports: ["net/http"] })
extern class Transport {

    @:native("Proxy") var proxy: (p0: go.Pointer<go.net.http.Request>) -> (go.Result<go.Pointer<go.net.url.URL>>);
    @:native("OnProxyConnectResponse") var onProxyConnectResponse: (ctx: go.context.Context, proxyURL: go.Pointer<go.net.url.URL>, connectReq: go.Pointer<go.net.http.Request>, connectRes: go.Pointer<go.net.http.Response>) -> (go.Error);
    @:native("DialContext") var dialContext: (ctx: go.context.Context, network: String, addr: String) -> (go.Result<go.net.Conn>);
    @:native("Dial") var dial: (network: String, addr: String) -> (go.Result<go.net.Conn>);
    @:native("DialTLSContext") var dialTLSContext: (ctx: go.context.Context, network: String, addr: String) -> (go.Result<go.net.Conn>);
    @:native("DialTLS") var dialTLS: (network: String, addr: String) -> (go.Result<go.net.Conn>);
    @:native("TLSClientConfig") var tLSClientConfig: go.Pointer<go.crypto.tls.Config>;
    @:native("TLSHandshakeTimeout") var tLSHandshakeTimeout: go.time.Duration;
    @:native("DisableKeepAlives") var disableKeepAlives: Bool;
    @:native("DisableCompression") var disableCompression: Bool;
    @:native("MaxIdleConns") var maxIdleConns: go.GoInt;
    @:native("MaxIdleConnsPerHost") var maxIdleConnsPerHost: go.GoInt;
    @:native("MaxConnsPerHost") var maxConnsPerHost: go.GoInt;
    @:native("IdleConnTimeout") var idleConnTimeout: go.time.Duration;
    @:native("ResponseHeaderTimeout") var responseHeaderTimeout: go.time.Duration;
    @:native("ExpectContinueTimeout") var expectContinueTimeout: go.time.Duration;
    @:native("TLSNextProto") var tLSNextProto: go.Map<String, (authority: String, c: go.Pointer<go.crypto.tls.Conn>) -> (go.net.http.RoundTripper)>;
    @:native("ProxyConnectHeader") var proxyConnectHeader: go.net.http.Header;
    @:native("GetProxyConnectHeader") var getProxyConnectHeader: (ctx: go.context.Context, proxyURL: go.Pointer<go.net.url.URL>, target: String) -> (go.Result<go.net.http.Header>);
    @:native("MaxResponseHeaderBytes") var maxResponseHeaderBytes: go.Int64;
    @:native("WriteBufferSize") var writeBufferSize: go.GoInt;
    @:native("ReadBufferSize") var readBufferSize: go.GoInt;
    @:native("ForceAttemptHTTP2") var forceAttemptHTTP2: Bool;
    @:native("HTTP2") var HTTP2: go.Pointer<go.net.http.HTTP2Config>;
    @:native("Protocols") var protocols: go.Pointer<go.net.http.Protocols>;

    function new(proxy: (p0: go.Pointer<go.net.http.Request>) -> (go.Result<go.Pointer<go.net.url.URL>>)=null, onProxyConnectResponse: (ctx: go.context.Context, proxyURL: go.Pointer<go.net.url.URL>, connectReq: go.Pointer<go.net.http.Request>, connectRes: go.Pointer<go.net.http.Response>) -> (go.Error)=null, dialContext: (ctx: go.context.Context, network: String, addr: String) -> (go.Result<go.net.Conn>)=null, dial: (network: String, addr: String) -> (go.Result<go.net.Conn>)=null, dialTLSContext: (ctx: go.context.Context, network: String, addr: String) -> (go.Result<go.net.Conn>)=null, dialTLS: (network: String, addr: String) -> (go.Result<go.net.Conn>)=null, tLSClientConfig: go.Pointer<go.crypto.tls.Config>=null, tLSHandshakeTimeout: go.time.Duration=cast 0, disableKeepAlives: Bool=false, disableCompression: Bool=false, maxIdleConns: go.GoInt=0, maxIdleConnsPerHost: go.GoInt=0, maxConnsPerHost: go.GoInt=0, idleConnTimeout: go.time.Duration=cast 0, responseHeaderTimeout: go.time.Duration=cast 0, expectContinueTimeout: go.time.Duration=cast 0, tLSNextProto: go.Map<String, (authority: String, c: go.Pointer<go.crypto.tls.Conn>) -> (go.net.http.RoundTripper)>=null, proxyConnectHeader: go.net.http.Header=null, getProxyConnectHeader: (ctx: go.context.Context, proxyURL: go.Pointer<go.net.url.URL>, target: String) -> (go.Result<go.net.http.Header>)=null, maxResponseHeaderBytes: go.Int64=0, writeBufferSize: go.GoInt=0, readBufferSize: go.GoInt=0, forceAttemptHTTP2: Bool=false, HTTP2: go.Pointer<go.net.http.HTTP2Config>=null, protocols: go.Pointer<go.net.http.Protocols>=null);

    @:native("CancelRequest") function cancelRequest(req: go.Pointer<go.net.http.Request>): Void;
    @:native("Clone") function clone(): (go.Pointer<go.net.http.Transport>);
    @:native("CloseIdleConnections") function closeIdleConnections(): Void;
    @:native("NewClientConn") function newClientConn(ctx: go.context.Context, scheme: String, address: String): (go.Result<go.Pointer<go.net.http.ClientConn>>);
    @:native("RegisterProtocol") function registerProtocol(scheme: String, rt: go.net.http.RoundTripper): Void;
    @:native("RoundTrip") function roundTrip(req: go.Pointer<go.net.http.Request>): (go.Result<go.Pointer<go.net.http.Response>>);

}