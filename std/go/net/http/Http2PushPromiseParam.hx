package go.net.http;

@:structInit
@:go.Type({ name: "http2PushPromiseParam", instanceName: "http.http2PushPromiseParam", imports: ["net/http"] })
extern class Http2PushPromiseParam {

    @:native("StreamID") var streamID: go.UInt32;
    @:native("PromiseID") var promiseID: go.UInt32;
    @:native("BlockFragment") var blockFragment: go.Slice<go.Byte>;
    @:native("EndHeaders") var endHeaders: Bool;
    @:native("PadLength") var padLength: go.UInt8;

    function new(streamID: go.UInt32=0, promiseID: go.UInt32=0, blockFragment: go.Slice<go.Byte>=null, endHeaders: Bool=false, padLength: go.UInt8=0);

}