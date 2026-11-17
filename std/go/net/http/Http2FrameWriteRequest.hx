package go.net.http;

@:structInit
@:go.Type({ name: "http2FrameWriteRequest", instanceName: "http.http2FrameWriteRequest", imports: ["net/http"] })
extern class Http2FrameWriteRequest {

    @:go.Tuple("p0", "p1", "p2") @:native("Consume") function consume(n: go.Int32): (go.Tuple<{ p0: go.net.http.Http2FrameWriteRequest, p1: go.net.http.Http2FrameWriteRequest, p2: go.GoInt }>);
    @:native("DataSize") function dataSize(): (go.GoInt);
    @:native("StreamID") function streamID(): (go.UInt32);
    @:native("String") function string(): (String);

}