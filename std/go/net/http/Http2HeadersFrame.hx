package go.net.http;

@:structInit
@:go.Type({ name: "http2HeadersFrame", instanceName: "http.http2HeadersFrame", imports: ["net/http"] })
extern class Http2HeadersFrame {

    @:native("Priority") var priority: go.net.http.Http2PriorityParam;
    @:native("Type") var type: go.net.http.Http2FrameType;
    @:native("Flags") var flags: go.net.http.Http2Flags;
    @:native("Length") var length: go.UInt32;
    @:native("StreamID") var streamID: go.UInt32;

    function new(priority: go.net.http.Http2PriorityParam);

    @:native("HasPriority") function hasPriority(): (Bool);
    @:native("Header") function header(): (go.net.http.Http2FrameHeader);
    @:native("HeaderBlockFragment") function headerBlockFragment(): (go.Slice<go.Byte>);
    @:native("HeadersEnded") function headersEnded(): (Bool);
    @:native("StreamEnded") function streamEnded(): (Bool);
    @:native("String") function string(): (String);

}