package go.net.rpc.jsonrpc;

@:structInit
@:go.Type({ name: "serverCodec", instanceName: "jsonrpc.serverCodec", imports: ["net/rpc/jsonrpc"] })
extern class ServerCodec {

    @:native("Close") function close(): (go.Error);
    @:native("ReadRequestBody") function readRequestBody(x: Dynamic): (go.Error);
    @:native("ReadRequestHeader") function readRequestHeader(r: go.Pointer<go.net.rpc.Request>): (go.Error);
    @:native("WriteResponse") function writeResponse(r: go.Pointer<go.net.rpc.Response>, x: Dynamic): (go.Error);

}