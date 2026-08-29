package go.net.rpc;

/**
    A ServerCodec implements reading of RPC requests and writing of
    RPC responses for the server side of an RPC session.
    The server calls [ServerCodec.ReadRequestHeader] and [ServerCodec.ReadRequestBody] in pairs
    to read requests from the connection, and it calls [ServerCodec.WriteResponse] to
    write a response back. The server calls [ServerCodec.Close] when finished with the
    connection. ReadRequestBody may be called with a nil
    argument to force the body of the request to be read and discarded.
    See [NewClient]'s comment for information about concurrent access.
**/
@:go.Type({ name: "ServerCodec", instanceName: "rpc.ServerCodec", imports: ["net/rpc"] })
extern typedef ServerCodec = {

    @:native("Close") function close(): (go.Error);
    @:native("ReadRequestBody") function readRequestBody(p0: Dynamic): (go.Error);
    @:native("ReadRequestHeader") function readRequestHeader(p0: go.Pointer<go.net.rpc.Request>): (go.Error);
    @:native("WriteResponse") function writeResponse(p0: go.Pointer<go.net.rpc.Response>, p1: Dynamic): (go.Error);

}