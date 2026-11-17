package go.net.http;

@:structInit
@:go.Type({ name: "http2PriorityFrame", instanceName: "http.http2PriorityFrame", imports: ["net/http"] })
extern class Http2PriorityFrame {

    @:native("Type") var type: go.net.http.Http2FrameType;
    @:native("Flags") var flags: go.net.http.Http2Flags;
    @:native("Length") var length: go.UInt32;
    @:native("StreamID") var streamID: go.UInt32;
    @:native("StreamDep") var streamDep: go.UInt32;
    @:native("Exclusive") var exclusive: Bool;
    @:native("Weight") var weight: go.UInt8;

    @:native("Header") function header(): (go.net.http.Http2FrameHeader);
    @:native("IsZero") function isZero(): (Bool);
    @:native("String") function string(): (String);

}