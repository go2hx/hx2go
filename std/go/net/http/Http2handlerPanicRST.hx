package go.net.http;

@:structInit
@:go.Type({ name: "http2handlerPanicRST", instanceName: "http.http2handlerPanicRST", imports: ["net/http"] })
extern class Http2handlerPanicRST {

    @:native("StreamID") var streamID: go.UInt32;

    function new(streamID: go.UInt32);

}