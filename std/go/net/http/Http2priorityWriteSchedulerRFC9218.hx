package go.net.http;

@:structInit
@:go.Type({ name: "http2priorityWriteSchedulerRFC9218", instanceName: "http.http2priorityWriteSchedulerRFC9218", imports: ["net/http"] })
extern class Http2priorityWriteSchedulerRFC9218 {

    @:native("AdjustStream") function adjustStream(streamID: go.UInt32, priority: go.net.http.Http2PriorityParam): Void;
    @:native("CloseStream") function closeStream(streamID: go.UInt32): Void;
    @:native("OpenStream") function openStream(streamID: go.UInt32, opt: go.net.http.Http2OpenStreamOptions): Void;
    @:go.Tuple("p0", "p1") @:native("Pop") function pop(): (go.Tuple<{ p0: go.net.http.Http2FrameWriteRequest, p1: Bool }>);
    @:native("Push") function push(wr: go.net.http.Http2FrameWriteRequest): Void;

}