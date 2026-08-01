package go.net.http;

@:go.Type({ name: "http2WriteScheduler", instanceName: "http.http2WriteScheduler", imports: ["net/http"] })
extern typedef Http2WriteScheduler = {

    @:native("AdjustStream") function adjustStream(streamID: go.UInt32, priority: go.net.http.Http2PriorityParam): Void;
    @:native("CloseStream") function closeStream(streamID: go.UInt32): Void;
    @:native("OpenStream") function openStream(streamID: go.UInt32, options: go.net.http.Http2OpenStreamOptions): Void;
    @:go.Tuple("wr", "ok") @:native("Pop") function pop(): (go.Tuple<{ wr: go.net.http.Http2FrameWriteRequest, ok: Bool }>);
    @:native("Push") function push(wr: go.net.http.Http2FrameWriteRequest): Void;

}