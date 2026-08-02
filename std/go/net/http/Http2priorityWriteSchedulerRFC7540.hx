package go.net.http;

@:structInit
@:go.Type({ name: "http2priorityWriteSchedulerRFC7540", instanceName: "http.http2priorityWriteSchedulerRFC7540", imports: ["net/http"] })
extern class Http2priorityWriteSchedulerRFC7540 {

    @:native("AdjustStream") function adjustStream(streamID: go.UInt32, priority: go.net.http.Http2PriorityParam): Void;
    @:native("CloseStream") function closeStream(streamID: go.UInt32): Void;
    @:native("OpenStream") function openStream(streamID: go.UInt32, options: go.net.http.Http2OpenStreamOptions): Void;
    @:go.Tuple("wr", "ok") @:native("Pop") function pop(): (go.Tuple<{ wr: go.net.http.Http2FrameWriteRequest, ok: Bool }>);
    @:native("Push") function push(wr: go.net.http.Http2FrameWriteRequest): Void;

}