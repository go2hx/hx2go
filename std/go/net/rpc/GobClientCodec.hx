package go.net.rpc;

@:structInit
@:go.Type({ name: "gobClientCodec", instanceName: "rpc.gobClientCodec", imports: ["net/rpc"] })
extern class GobClientCodec {

    @:native("Close") function close(): (go.Error);
    @:native("ReadResponseBody") function readResponseBody(body: Dynamic): (go.Error);
    @:native("ReadResponseHeader") function readResponseHeader(r: go.Pointer<go.net.rpc.Response>): (go.Error);
    @:native("WriteRequest") function writeRequest(r: go.Pointer<go.net.rpc.Request>, body: Dynamic): (go.Error);

}