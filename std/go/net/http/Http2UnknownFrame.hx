package go.net.http;

@:structInit
@:go.Type({ name: "http2UnknownFrame", instanceName: "http.http2UnknownFrame", imports: ["net/http"] })
extern class Http2UnknownFrame {

    @:native("Type") var type: go.net.http.Http2FrameType;
    @:native("Flags") var flags: go.net.http.Http2Flags;
    @:native("Length") var length: go.UInt32;
    @:native("StreamID") var streamID: go.UInt32;

    @:native("Header") function header(): (go.net.http.Http2FrameHeader);
    @:native("Payload") function payload(): (go.Slice<go.Byte>);
    @:native("String") function string(): (String);

}