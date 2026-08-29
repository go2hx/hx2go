package go.net.http;

@:structInit
@:go.Type({ name: "http2PriorityParam", instanceName: "http.http2PriorityParam", imports: ["net/http"] })
extern class Http2PriorityParam {

    @:native("StreamDep") var streamDep: go.UInt32;
    @:native("Exclusive") var exclusive: Bool;
    @:native("Weight") var weight: go.UInt8;

    function new(streamDep: go.UInt32=0, exclusive: Bool=false, weight: go.UInt8=0);

    @:native("IsZero") function isZero(): (Bool);

}