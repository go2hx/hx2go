package go.net.http;

@:structInit
@:go.Type({ name: "http2HeadersFrameParam", instanceName: "http.http2HeadersFrameParam", imports: ["net/http"] })
extern class Http2HeadersFrameParam {

    @:native("StreamID") var streamID: go.UInt32;
    @:native("BlockFragment") var blockFragment: go.Slice<go.Byte>;
    @:native("EndStream") var endStream: Bool;
    @:native("EndHeaders") var endHeaders: Bool;
    @:native("PadLength") var padLength: go.UInt8;
    @:native("Priority") var priority: go.net.http.Http2PriorityParam;

    function new(streamID: go.UInt32=0, blockFragment: go.Slice<go.Byte>=null, endStream: Bool=false, endHeaders: Bool=false, padLength: go.UInt8=0, priority: go.net.http.Http2PriorityParam);

}