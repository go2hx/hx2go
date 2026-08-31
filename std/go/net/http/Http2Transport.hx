package go.net.http;

@:structInit
@:go.Type({ name: "http2Transport", instanceName: "http.http2Transport", imports: ["net/http"] })
extern class Http2Transport {

    @:native("DialTLSContext") var dialTLSContext: (ctx: go.context.Context, network: String, addr: String, cfg: go.Pointer<go.crypto.tls.Config>) -> (go.Result<go.net.Conn>);
    @:native("DialTLS") var dialTLS: (network: String, addr: String, cfg: go.Pointer<go.crypto.tls.Config>) -> (go.Result<go.net.Conn>);
    @:native("TLSClientConfig") var tLSClientConfig: go.Pointer<go.crypto.tls.Config>;
    @:native("ConnPool") var connPool: go.net.http.Http2ClientConnPool;
    @:native("DisableCompression") var disableCompression: Bool;
    @:native("AllowHTTP") var allowHTTP: Bool;
    @:native("MaxHeaderListSize") var maxHeaderListSize: go.UInt32;
    @:native("MaxReadFrameSize") var maxReadFrameSize: go.UInt32;
    @:native("MaxDecoderHeaderTableSize") var maxDecoderHeaderTableSize: go.UInt32;
    @:native("MaxEncoderHeaderTableSize") var maxEncoderHeaderTableSize: go.UInt32;
    @:native("StrictMaxConcurrentStreams") var strictMaxConcurrentStreams: Bool;
    @:native("IdleConnTimeout") var idleConnTimeout: go.time.Duration;
    @:native("ReadIdleTimeout") var readIdleTimeout: go.time.Duration;
    @:native("PingTimeout") var pingTimeout: go.time.Duration;
    @:native("WriteByteTimeout") var writeByteTimeout: go.time.Duration;
    @:native("CountError") var countError: (errType: String) -> Void;

    function new(dialTLSContext: (ctx: go.context.Context, network: String, addr: String, cfg: go.Pointer<go.crypto.tls.Config>) -> (go.Result<go.net.Conn>)=null, dialTLS: (network: String, addr: String, cfg: go.Pointer<go.crypto.tls.Config>) -> (go.Result<go.net.Conn>)=null, tLSClientConfig: go.Pointer<go.crypto.tls.Config>=null, connPool: go.net.http.Http2ClientConnPool=null, disableCompression: Bool=false, allowHTTP: Bool=false, maxHeaderListSize: go.UInt32=0, maxReadFrameSize: go.UInt32=0, maxDecoderHeaderTableSize: go.UInt32=0, maxEncoderHeaderTableSize: go.UInt32=0, strictMaxConcurrentStreams: Bool=false, idleConnTimeout: go.time.Duration=cast 0, readIdleTimeout: go.time.Duration=cast 0, pingTimeout: go.time.Duration=cast 0, writeByteTimeout: go.time.Duration=cast 0, countError: (errType: String) -> Void=null);

    @:native("CloseIdleConnections") function closeIdleConnections(): Void;
    @:native("NewClientConn") function newClientConn(c: go.net.Conn): (go.Result<go.Pointer<go.net.http.Http2ClientConn>>);
    @:native("RoundTrip") function roundTrip(req: go.Pointer<go.net.http.Request>): (go.Result<go.Pointer<go.net.http.Response>>);
    @:native("RoundTripOpt") function roundTripOpt(req: go.Pointer<go.net.http.Request>, opt: go.net.http.Http2RoundTripOpt): (go.Result<go.Pointer<go.net.http.Response>>);

}