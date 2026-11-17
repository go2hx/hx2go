package go.net.http;

@:structInit
@:go.Type({ name: "http2ContinuationFrame", instanceName: "http.http2ContinuationFrame", imports: ["net/http"] })
extern class Http2ContinuationFrame {

    @:native("Type") var type: go.net.http.Http2FrameType;
    @:native("Flags") var flags: go.net.http.Http2Flags;
    @:native("Length") var length: go.UInt32;
    @:native("StreamID") var streamID: go.UInt32;

    @:native("Header") function header(): (go.net.http.Http2FrameHeader);
    @:native("HeaderBlockFragment") function headerBlockFragment(): (go.Slice<go.Byte>);
    @:native("HeadersEnded") function headersEnded(): (Bool);
    @:native("String") function string(): (String);

}