package go.net.http;

@:structInit
@:go.Type({ name: "http2http2Config", instanceName: "http.http2http2Config", imports: ["net/http"] })
extern class Http2http2Config {

    @:native("MaxConcurrentStreams") var maxConcurrentStreams: go.UInt32;
    @:native("StrictMaxConcurrentRequests") var strictMaxConcurrentRequests: Bool;
    @:native("MaxDecoderHeaderTableSize") var maxDecoderHeaderTableSize: go.UInt32;
    @:native("MaxEncoderHeaderTableSize") var maxEncoderHeaderTableSize: go.UInt32;
    @:native("MaxReadFrameSize") var maxReadFrameSize: go.UInt32;
    @:native("MaxUploadBufferPerConnection") var maxUploadBufferPerConnection: go.Int32;
    @:native("MaxUploadBufferPerStream") var maxUploadBufferPerStream: go.Int32;
    @:native("SendPingTimeout") var sendPingTimeout: go.time.Duration;
    @:native("PingTimeout") var pingTimeout: go.time.Duration;
    @:native("WriteByteTimeout") var writeByteTimeout: go.time.Duration;
    @:native("PermitProhibitedCipherSuites") var permitProhibitedCipherSuites: Bool;
    @:native("CountError") var countError: (errType: String) -> Void;

    function new(maxConcurrentStreams: go.UInt32, strictMaxConcurrentRequests: Bool, maxDecoderHeaderTableSize: go.UInt32, maxEncoderHeaderTableSize: go.UInt32, maxReadFrameSize: go.UInt32, maxUploadBufferPerConnection: go.Int32, maxUploadBufferPerStream: go.Int32, sendPingTimeout: go.time.Duration, pingTimeout: go.time.Duration, writeByteTimeout: go.time.Duration, permitProhibitedCipherSuites: Bool, countError: (errType: String) -> Void);

}