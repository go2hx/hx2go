package go.net.rpc;

/**
    Response is a header written before every RPC return. It is used internally
    but documented here as an aid to debugging, such as when analyzing
    network traffic.
**/
@:structInit
@:go.Type({ name: "Response", instanceName: "rpc.Response", imports: ["net/rpc"] })
extern class Response {

    @:native("ServiceMethod") var serviceMethod: String;
    @:native("Seq") var seq: go.UInt64;
    @:native("Error") var error: String;

    function new(serviceMethod: String="", seq: go.UInt64=0, error: String="");

}