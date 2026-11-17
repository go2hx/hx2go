package go.net.http;

@:structInit
@:go.Type({ name: "http2WindowUpdateFrame", instanceName: "http.http2WindowUpdateFrame", imports: ["net/http"] })
extern class Http2WindowUpdateFrame {

    @:native("Increment") var increment: go.UInt32;
    @:native("Type") var type: go.net.http.Http2FrameType;
    @:native("Flags") var flags: go.net.http.Http2Flags;
    @:native("Length") var length: go.UInt32;
    @:native("StreamID") var streamID: go.UInt32;

    function new(increment: go.UInt32=0);

    @:native("Header") function header(): (go.net.http.Http2FrameHeader);
    @:native("String") function string(): (String);

}