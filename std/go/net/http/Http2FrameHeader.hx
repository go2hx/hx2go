package go.net.http;

@:structInit
@:go.Type({ name: "http2FrameHeader", instanceName: "http.http2FrameHeader", imports: ["net/http"] })
extern class Http2FrameHeader {

    @:native("Type") var type: go.net.http.Http2FrameType;
    @:native("Flags") var flags: go.net.http.Http2Flags;
    @:native("Length") var length: go.UInt32;
    @:native("StreamID") var streamID: go.UInt32;

    function new(type: go.net.http.Http2FrameType, flags: go.net.http.Http2Flags, length: go.UInt32, streamID: go.UInt32);

    @:native("Header") function header(): (go.net.http.Http2FrameHeader);
    @:native("String") function string(): (String);

}