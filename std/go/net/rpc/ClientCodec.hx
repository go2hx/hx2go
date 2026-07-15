package go.net.rpc;

@:go.Type({ name: "ClientCodec", instanceName: "rpc.ClientCodec", imports: ["net/rpc"] })
extern typedef ClientCodec = {

    @:native("Close") function close(): go.Error;
    @:native("ReadResponseBody") function readResponseBody(p0: Dynamic): go.Error;
    @:native("ReadResponseHeader") function readResponseHeader(p0: go.Pointer<go.net.rpc.Response>): go.Error;
    @:native("WriteRequest") function writeRequest(p0: go.Pointer<go.net.rpc.Request>, p1: Dynamic): go.Error;

}