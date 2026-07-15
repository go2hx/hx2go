package go.net.rpc;

@:structInit
@:go.Type({ name: "Response", instanceName: "rpc.Response", imports: ["net/rpc"] })
extern class Response {

    @:native("ServiceMethod") var serviceMethod: String;
    @:native("Seq") var seq: go.UInt64;
    @:native("Error") var error: String;

function new(serviceMethod: String, seq: go.UInt64, error: String);

}