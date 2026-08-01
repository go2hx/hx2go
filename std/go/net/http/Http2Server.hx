package go.net.http;

@:structInit
@:go.Type({ name: "http2Server", instanceName: "http.http2Server", imports: ["net/http"] })
extern class Http2Server {

    @:native("MaxHandlers") var maxHandlers: go.GoInt;
    @:native("MaxConcurrentStreams") var maxConcurrentStreams: go.UInt32;
    @:native("MaxDecoderHeaderTableSize") var maxDecoderHeaderTableSize: go.UInt32;
    @:native("MaxEncoderHeaderTableSize") var maxEncoderHeaderTableSize: go.UInt32;
    @:native("MaxReadFrameSize") var maxReadFrameSize: go.UInt32;
    @:native("PermitProhibitedCipherSuites") var permitProhibitedCipherSuites: Bool;
    @:native("IdleTimeout") var idleTimeout: go.time.Duration;
    @:native("ReadIdleTimeout") var readIdleTimeout: go.time.Duration;
    @:native("PingTimeout") var pingTimeout: go.time.Duration;
    @:native("WriteByteTimeout") var writeByteTimeout: go.time.Duration;
    @:native("MaxUploadBufferPerConnection") var maxUploadBufferPerConnection: go.Int32;
    @:native("MaxUploadBufferPerStream") var maxUploadBufferPerStream: go.Int32;
    @:native("NewWriteScheduler") var newWriteScheduler: () -> (go.net.http.Http2WriteScheduler);
    @:native("CountError") var countError: (errType: String) -> Void;

    function new(maxHandlers: go.GoInt, maxConcurrentStreams: go.UInt32, maxDecoderHeaderTableSize: go.UInt32, maxEncoderHeaderTableSize: go.UInt32, maxReadFrameSize: go.UInt32, permitProhibitedCipherSuites: Bool, idleTimeout: go.time.Duration, readIdleTimeout: go.time.Duration, pingTimeout: go.time.Duration, writeByteTimeout: go.time.Duration, maxUploadBufferPerConnection: go.Int32, maxUploadBufferPerStream: go.Int32, newWriteScheduler: () -> (go.net.http.Http2WriteScheduler), countError: (errType: String) -> Void);

    @:native("ServeConn") function serveConn(c: go.net.Conn, opts: go.Pointer<go.net.http.Http2ServeConnOpts>): Void;

}