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

    function new(maxHandlers: go.GoInt=0, maxConcurrentStreams: go.UInt32=0, maxDecoderHeaderTableSize: go.UInt32=0, maxEncoderHeaderTableSize: go.UInt32=0, maxReadFrameSize: go.UInt32=0, permitProhibitedCipherSuites: Bool=false, idleTimeout: go.time.Duration=cast 0, readIdleTimeout: go.time.Duration=cast 0, pingTimeout: go.time.Duration=cast 0, writeByteTimeout: go.time.Duration=cast 0, maxUploadBufferPerConnection: go.Int32=0, maxUploadBufferPerStream: go.Int32=0, newWriteScheduler: () -> (go.net.http.Http2WriteScheduler)=null, countError: (errType: String) -> Void=null);

    @:native("ServeConn") function serveConn(c: go.net.Conn, opts: go.Pointer<go.net.http.Http2ServeConnOpts>): Void;

}