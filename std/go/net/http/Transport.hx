package go.net.http;

/**
    Transport is an implementation of [RoundTripper] that supports HTTP,
    HTTPS, and HTTP proxies (for either HTTP or HTTPS with CONNECT).
    
    By default, Transport caches connections for future re-use.
    This may leave many open connections when accessing many hosts.
    This behavior can be managed using [Transport.CloseIdleConnections] method
    and the [Transport.MaxIdleConnsPerHost] and [Transport.DisableKeepAlives] fields.
    
    Transports should be reused instead of created as needed.
    Transports are safe for concurrent use by multiple goroutines.
    
    A Transport is a low-level primitive for making HTTP and HTTPS requests.
    For high-level functionality, such as cookies and redirects, see [Client].
    
    Transport uses HTTP/1.1 for HTTP URLs and either HTTP/1.1 or HTTP/2
    for HTTPS URLs, depending on whether the server supports HTTP/2,
    and how the Transport is configured. The [DefaultTransport] supports HTTP/2.
    To explicitly enable HTTP/2 on a transport, set [Transport.Protocols].
    
    Responses with status codes in the 1xx range are either handled
    automatically (100 expect-continue) or ignored. The one
    exception is HTTP status code 101 (Switching Protocols), which is
    considered a terminal status and returned by [Transport.RoundTrip]. To see the
    ignored 1xx responses, use the httptrace trace package's
    ClientTrace.Got1xxResponse.
    
    Transport only retries a request upon encountering a network error
    if the connection has already been used successfully and if the
    request is idempotent and either has no body or has its [Request.GetBody]
    defined. HTTP requests are considered idempotent if they have HTTP methods
    GET, HEAD, OPTIONS, or TRACE; or if their [Header] map contains an
    "Idempotency-Key" or "X-Idempotency-Key" entry. If the idempotency key
    value is a zero-length slice, the request is treated as idempotent but the
    header is not sent on the wire.
**/
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

    /**
        CancelRequest cancels an in-flight request by closing its connection.
        CancelRequest should only be called after [Transport.RoundTrip] has returned.
        
        Deprecated: Use [Request.WithContext] to create a request with a
        cancelable context instead. CancelRequest cannot cancel HTTP/2
        requests. This may become a no-op in a future release of Go.
    **/
    @:native("CancelRequest") function cancelRequest(req: go.Pointer<go.net.http.Request>): Void;
    /**
        Clone returns a deep copy of t's exported fields.
    **/
    @:native("Clone") function clone(): (go.Pointer<go.net.http.Transport>);
    /**
        CloseIdleConnections closes any connections which were previously
        connected from previous requests but are now sitting idle in
        a "keep-alive" state. It does not interrupt any connections currently
        in use.
    **/
    @:native("CloseIdleConnections") function closeIdleConnections(): Void;
    /**
        NewClientConn creates a new client connection to the given address.
        
        If scheme is "http", the connection is unencrypted.
        If scheme is "https", the connection uses TLS.
        
        The protocol used for the new connection is determined by the scheme,
        Transport.Protocols configuration field, and protocols supported by the
        server. See Transport.Protocols for more details.
        
        If Transport.Proxy is set and indicates that a request sent to the given
        address should use a proxy, the new connection uses that proxy.
        
        NewClientConn always creates a new connection,
        even if the Transport has an existing cached connection to the given host.
        
        The new connection is not added to the Transport's connection cache,
        and will not be used by [Transport.RoundTrip].
        It does not count against the MaxIdleConns and MaxConnsPerHost limits.
        
        The caller is responsible for closing the new connection.
    **/
    @:native("NewClientConn") function newClientConn(ctx: go.context.Context, scheme: String, address: String): (go.Result<go.Pointer<go.net.http.ClientConn>>);
    /**
        RegisterProtocol registers a new protocol with scheme.
        The [Transport] will pass requests using the given scheme to rt.
        It is rt's responsibility to simulate HTTP request semantics.
        
        RegisterProtocol can be used by other packages to provide
        implementations of protocol schemes like "ftp" or "file".
        
        If rt.RoundTrip returns [ErrSkipAltProtocol], the Transport will
        handle the [Transport.RoundTrip] itself for that one request, as if the
        protocol were not registered.
    **/
    @:native("RegisterProtocol") function registerProtocol(scheme: String, rt: go.net.http.RoundTripper): Void;
    /**
        RoundTrip implements the [RoundTripper] interface.
        
        For higher-level HTTP client support (such as handling of cookies
        and redirects), see [Get], [Post], and the [Client] type.
        
        Like the RoundTripper interface, the error types returned
        by RoundTrip are unspecified.
    **/
    @:native("RoundTrip") function roundTrip(req: go.Pointer<go.net.http.Request>): (go.Result<go.Pointer<go.net.http.Response>>);

}