package go.net.http;

@:structInit
@:go.Type({ name: "HTTP2Config", instanceName: "http.HTTP2Config", imports: ["net/http"] })
extern class HTTP2Config {

    @:native("MaxConcurrentStreams") var maxConcurrentStreams: go.GoInt;
    @:native("StrictMaxConcurrentRequests") var strictMaxConcurrentRequests: Bool;
    @:native("MaxDecoderHeaderTableSize") var maxDecoderHeaderTableSize: go.GoInt;
    @:native("MaxEncoderHeaderTableSize") var maxEncoderHeaderTableSize: go.GoInt;
    @:native("MaxReadFrameSize") var maxReadFrameSize: go.GoInt;
    @:native("MaxReceiveBufferPerConnection") var maxReceiveBufferPerConnection: go.GoInt;
    @:native("MaxReceiveBufferPerStream") var maxReceiveBufferPerStream: go.GoInt;
    @:native("SendPingTimeout") var sendPingTimeout: go.time.Duration;
    @:native("PingTimeout") var pingTimeout: go.time.Duration;
    @:native("WriteByteTimeout") var writeByteTimeout: go.time.Duration;
    @:native("PermitProhibitedCipherSuites") var permitProhibitedCipherSuites: Bool;
    @:native("CountError") var countError: (errType: String) -> Void;

function new(maxConcurrentStreams: go.GoInt, strictMaxConcurrentRequests: Bool, maxDecoderHeaderTableSize: go.GoInt, maxEncoderHeaderTableSize: go.GoInt, maxReadFrameSize: go.GoInt, maxReceiveBufferPerConnection: go.GoInt, maxReceiveBufferPerStream: go.GoInt, sendPingTimeout: go.time.Duration, pingTimeout: go.time.Duration, writeByteTimeout: go.time.Duration, permitProhibitedCipherSuites: Bool, countError: (errType: String) -> Void);

}