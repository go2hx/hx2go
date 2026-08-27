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

    function new(maxConcurrentStreams: go.GoInt=0, strictMaxConcurrentRequests: Bool=false, maxDecoderHeaderTableSize: go.GoInt=0, maxEncoderHeaderTableSize: go.GoInt=0, maxReadFrameSize: go.GoInt=0, maxReceiveBufferPerConnection: go.GoInt=0, maxReceiveBufferPerStream: go.GoInt=0, sendPingTimeout: go.time.Duration=cast 0, pingTimeout: go.time.Duration=cast 0, writeByteTimeout: go.time.Duration=cast 0, permitProhibitedCipherSuites: Bool=false, countError: (errType: String) -> Void=null);

}