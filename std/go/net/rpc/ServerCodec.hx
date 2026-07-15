package go.net.rpc;

@:go.Type({ name: "ServerCodec", instanceName: "rpc.ServerCodec", imports: ["net/rpc"] })
extern typedef ServerCodec = {

    @:native("Close") function close(): go.Error;
    @:native("ReadRequestBody") function readRequestBody(p0: Dynamic): go.Error;
    @:native("ReadRequestHeader") function readRequestHeader(p0: go.Pointer<go.net.rpc.Request>): go.Error;
    @:native("WriteResponse") function writeResponse(p0: go.Pointer<go.net.rpc.Response>, p1: Dynamic): go.Error;

}