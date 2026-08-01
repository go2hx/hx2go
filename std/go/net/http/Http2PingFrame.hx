package go.net.http;

@:structInit
@:go.Type({ name: "http2PingFrame", instanceName: "http.http2PingFrame", imports: ["net/http"] })
extern class Http2PingFrame {

    @:native("Data") var data: go.GoArray<go.Byte, 8>;
    @:native("Type") var type: go.net.http.Http2FrameType;
    @:native("Flags") var flags: go.net.http.Http2Flags;
    @:native("Length") var length: go.UInt32;
    @:native("StreamID") var streamID: go.UInt32;

    function new(data: go.GoArray<go.Byte, 8>);

    @:native("Header") function header(): (go.net.http.Http2FrameHeader);
    @:native("IsAck") function isAck(): (Bool);
    @:native("String") function string(): (String);

}