package go.net.http;

@:structInit
@:go.Type({ name: "http2DataFrame", instanceName: "http.http2DataFrame", imports: ["net/http"] })
extern class Http2DataFrame {

    @:native("Type") var type: go.net.http.Http2FrameType;
    @:native("Flags") var flags: go.net.http.Http2Flags;
    @:native("Length") var length: go.UInt32;
    @:native("StreamID") var streamID: go.UInt32;

    @:native("Data") function data(): (go.Slice<go.Byte>);
    @:native("Header") function header(): (go.net.http.Http2FrameHeader);
    @:native("StreamEnded") function streamEnded(): (Bool);
    @:native("String") function string(): (String);

}