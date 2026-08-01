package go.net.http;

@:structInit
@:go.Type({ name: "http2unencryptedTransport", instanceName: "http.http2unencryptedTransport", imports: ["net/http"] })
extern class Http2unencryptedTransport {

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

    function new(dialTLSContext: (ctx: go.context.Context, network: String, addr: String, cfg: go.Pointer<go.crypto.tls.Config>) -> (go.Result<go.net.Conn>), dialTLS: (network: String, addr: String, cfg: go.Pointer<go.crypto.tls.Config>) -> (go.Result<go.net.Conn>), tLSClientConfig: go.Pointer<go.crypto.tls.Config>, connPool: go.net.http.Http2ClientConnPool, disableCompression: Bool, allowHTTP: Bool, maxHeaderListSize: go.UInt32, maxReadFrameSize: go.UInt32, maxDecoderHeaderTableSize: go.UInt32, maxEncoderHeaderTableSize: go.UInt32, strictMaxConcurrentStreams: Bool, idleConnTimeout: go.time.Duration, readIdleTimeout: go.time.Duration, pingTimeout: go.time.Duration, writeByteTimeout: go.time.Duration, countError: (errType: String) -> Void);

    @:native("RoundTrip") function roundTrip(req: go.Pointer<go.net.http.Request>): (go.Result<go.Pointer<go.net.http.Response>>);

}