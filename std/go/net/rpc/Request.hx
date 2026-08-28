package go.net.rpc;

/**
    Request is a header written before every RPC call. It is used internally
    but documented here as an aid to debugging, such as when analyzing
    network traffic.
**/
@:structInit
@:go.Type({ name: "Request", instanceName: "rpc.Request", imports: ["net/rpc"] })
extern class Request {

    @:native("ServiceMethod") var serviceMethod: String;
    @:native("Seq") var seq: go.UInt64;

    function new(serviceMethod: String="", seq: go.UInt64=0);

}