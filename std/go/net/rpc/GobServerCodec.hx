package go.net.rpc;

@:structInit
@:go.Type({ name: "gobServerCodec", instanceName: "rpc.gobServerCodec", imports: ["net/rpc"] })
extern class GobServerCodec {

    @:native("Close") function close(): (go.Error);
    @:native("ReadRequestBody") function readRequestBody(body: Dynamic): (go.Error);
    @:native("ReadRequestHeader") function readRequestHeader(r: go.Pointer<go.net.rpc.Request>): (go.Error);
    @:native("WriteResponse") function writeResponse(r: go.Pointer<go.net.rpc.Response>, body: Dynamic): (go.Error);

}