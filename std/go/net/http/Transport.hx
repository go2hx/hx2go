package go.net.http;

@:structInit
@:go.Type({ name: "Transport", instanceName: "http.Transport", imports: ["net/http"] })
extern class Transport {

    @:native("Proxy") var proxy: (p0: go.Pointer<go.net.http.Request>) -> go.Result<go.Pointer<go.net.url.URL>>;
    @:native("OnProxyConnectResponse") var onProxyConnectResponse: (ctx: go.context.Context, proxyURL: go.Pointer<go.net.url.URL>, connectReq: go.Pointer<go.net.http.Request>, connectRes: go.Pointer<go.net.http.Response>) -> go.Error;
    @:native("DialContext") var dialContext: (ctx: go.context.Context, network: String, addr: String) -> go.Result<go.net.Conn>;
    @:native("Dial") var dial: (network: String, addr: String) -> go.Result<go.net.Conn>;
    @:native("DialTLSContext") var dialTLSContext: (ctx: go.context.Context, network: String, addr: String) -> go.Result<go.net.Conn>;
    @:native("DialTLS") var dialTLS: (network: String, addr: String) -> go.Result<go.net.Conn>;
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
    @:native("TLSNextProto") var tLSNextProto: go.Map<String, (authority: String, c: go.Pointer<go.crypto.tls.Conn>) -> go.net.http.RoundTripper>;
    @:native("ProxyConnectHeader") var proxyConnectHeader: go.net.http.Header;
    @:native("GetProxyConnectHeader") var getProxyConnectHeader: (ctx: go.context.Context, proxyURL: go.Pointer<go.net.url.URL>, target: String) -> go.Result<go.net.http.Header>;
    @:native("MaxResponseHeaderBytes") var maxResponseHeaderBytes: go.Int64;
    @:native("WriteBufferSize") var writeBufferSize: go.GoInt;
    @:native("ReadBufferSize") var readBufferSize: go.GoInt;
    @:native("ForceAttemptHTTP2") var forceAttemptHTTP2: Bool;
    @:native("HTTP2") var HTTP2: go.Pointer<go.net.http.HTTP2Config>;
    @:native("Protocols") var protocols: go.Pointer<go.net.http.Protocols>;

function new(proxy: (p0: go.Pointer<go.net.http.Request>) -> go.Result<go.Pointer<go.net.url.URL>>, onProxyConnectResponse: (ctx: go.context.Context, proxyURL: go.Pointer<go.net.url.URL>, connectReq: go.Pointer<go.net.http.Request>, connectRes: go.Pointer<go.net.http.Response>) -> go.Error, dialContext: (ctx: go.context.Context, network: String, addr: String) -> go.Result<go.net.Conn>, dial: (network: String, addr: String) -> go.Result<go.net.Conn>, dialTLSContext: (ctx: go.context.Context, network: String, addr: String) -> go.Result<go.net.Conn>, dialTLS: (network: String, addr: String) -> go.Result<go.net.Conn>, tLSClientConfig: go.Pointer<go.crypto.tls.Config>, tLSHandshakeTimeout: go.time.Duration, disableKeepAlives: Bool, disableCompression: Bool, maxIdleConns: go.GoInt, maxIdleConnsPerHost: go.GoInt, maxConnsPerHost: go.GoInt, idleConnTimeout: go.time.Duration, responseHeaderTimeout: go.time.Duration, expectContinueTimeout: go.time.Duration, tLSNextProto: go.Map<String, (authority: String, c: go.Pointer<go.crypto.tls.Conn>) -> go.net.http.RoundTripper>, proxyConnectHeader: go.net.http.Header, getProxyConnectHeader: (ctx: go.context.Context, proxyURL: go.Pointer<go.net.url.URL>, target: String) -> go.Result<go.net.http.Header>, maxResponseHeaderBytes: go.Int64, writeBufferSize: go.GoInt, readBufferSize: go.GoInt, forceAttemptHTTP2: Bool, HTTP2: go.Pointer<go.net.http.HTTP2Config>, protocols: go.Pointer<go.net.http.Protocols>);

    @:native("CancelRequest") function cancelRequest(req: go.Pointer<go.net.http.Request>): Void;
    @:native("Clone") function clone(): go.Pointer<go.net.http.Transport>;
    @:native("CloseIdleConnections") function closeIdleConnections(): Void;
    @:native("NewClientConn") function newClientConn(ctx: go.context.Context, scheme: String, address: String): go.Result<go.Pointer<go.net.http.ClientConn>>;
    @:native("RegisterProtocol") function registerProtocol(scheme: String, rt: go.net.http.RoundTripper): Void;
    @:native("RoundTrip") function roundTrip(req: go.Pointer<go.net.http.Request>): go.Result<go.Pointer<go.net.http.Response>>;

}