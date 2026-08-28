package go.net.rpc;

/**
    A ClientCodec implements writing of RPC requests and
    reading of RPC responses for the client side of an RPC session.
    The client calls [ClientCodec.WriteRequest] to write a request to the connection
    and calls [ClientCodec.ReadResponseHeader] and [ClientCodec.ReadResponseBody] in pairs
    to read responses. The client calls [ClientCodec.Close] when finished with the
    connection. ReadResponseBody may be called with a nil
    argument to force the body of the response to be read and then
    discarded.
    See [NewClient]'s comment for information about concurrent access.
**/
@:go.Type({ name: "ClientCodec", instanceName: "rpc.ClientCodec", imports: ["net/rpc"] })
extern typedef ClientCodec = {

    @:native("Close") function close(): (go.Error);
    @:native("ReadResponseBody") function readResponseBody(p0: Dynamic): (go.Error);
    @:native("ReadResponseHeader") function readResponseHeader(p0: go.Pointer<go.net.rpc.Response>): (go.Error);
    @:native("WriteRequest") function writeRequest(p0: go.Pointer<go.net.rpc.Request>, p1: Dynamic): (go.Error);

}