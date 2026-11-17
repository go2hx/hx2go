package go.net.http;

@:structInit
@:go.Type({ name: "http2randomWriteScheduler", instanceName: "http.http2randomWriteScheduler", imports: ["net/http"] })
extern class Http2randomWriteScheduler {

    @:native("AdjustStream") function adjustStream(streamID: go.UInt32, priority: go.net.http.Http2PriorityParam): Void;
    @:native("CloseStream") function closeStream(streamID: go.UInt32): Void;
    @:native("OpenStream") function openStream(streamID: go.UInt32, options: go.net.http.Http2OpenStreamOptions): Void;
    @:go.Tuple("p0", "p1") @:native("Pop") function pop(): (go.Tuple<{ p0: go.net.http.Http2FrameWriteRequest, p1: Bool }>);
    @:native("Push") function push(wr: go.net.http.Http2FrameWriteRequest): Void;

}