package go.net.rpc.jsonrpc;

@:structInit
@:go.Type({ name: "clientCodec", instanceName: "jsonrpc.clientCodec", imports: ["net/rpc/jsonrpc"] })
extern class ClientCodec {

    @:native("Close") function close(): (go.Error);
    @:native("ReadResponseBody") function readResponseBody(x: Dynamic): (go.Error);
    @:native("ReadResponseHeader") function readResponseHeader(r: go.Pointer<go.net.rpc.Response>): (go.Error);
    @:native("WriteRequest") function writeRequest(r: go.Pointer<go.net.rpc.Request>, param: Dynamic): (go.Error);

}