package go.net.rpc;

@:structInit
@:go.Type({ name: "Request", instanceName: "rpc.Request", imports: ["net/rpc"] })
extern class Request {

    @:native("ServiceMethod") var serviceMethod: String;
    @:native("Seq") var seq: go.UInt64;

function new(serviceMethod: String, seq: go.UInt64);

}