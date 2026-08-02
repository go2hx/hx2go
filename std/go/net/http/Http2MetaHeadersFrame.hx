package go.net.http;

@:structInit
@:go.Type({ name: "http2MetaHeadersFrame", instanceName: "http.http2MetaHeadersFrame", imports: ["net/http"] })
extern class Http2MetaHeadersFrame {

    @:native("Fields") var fields: go.Slice<Dynamic>;
    @:native("Truncated") var truncated: Bool;
    @:native("Priority") var priority: go.net.http.Http2PriorityParam;
    @:native("Type") var type: go.net.http.Http2FrameType;
    @:native("Flags") var flags: go.net.http.Http2Flags;
    @:native("Length") var length: go.UInt32;
    @:native("StreamID") var streamID: go.UInt32;

    function new(fields: go.Slice<Dynamic>, truncated: Bool);

    @:native("HasPriority") function hasPriority(): (Bool);
    @:native("Header") function header(): (go.net.http.Http2FrameHeader);
    @:native("HeaderBlockFragment") function headerBlockFragment(): (go.Slice<go.Byte>);
    @:native("HeadersEnded") function headersEnded(): (Bool);
    @:native("PseudoFields") function pseudoFields(): (go.Slice<Dynamic>);
    @:native("PseudoValue") function pseudoValue(pseudo: String): (String);
    @:native("RegularFields") function regularFields(): (go.Slice<Dynamic>);
    @:native("StreamEnded") function streamEnded(): (Bool);
    @:native("String") function string(): (String);

}