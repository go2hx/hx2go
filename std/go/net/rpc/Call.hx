package go.net.rpc;

@:structInit
@:go.Type({ name: "Call", instanceName: "rpc.Call", imports: ["net/rpc"] })
extern class Call {

    @:native("ServiceMethod") var serviceMethod: String;
    @:native("Args") var args: Dynamic;
    @:native("Reply") var reply: Dynamic;
    @:native("Error") var error: go.Error;
    @:native("Done") var done: go.Chan<go.Pointer<go.net.rpc.Call>>;

function new(serviceMethod: String, args: Dynamic, reply: Dynamic, error: go.Error, done: go.Chan<go.Pointer<go.net.rpc.Call>>);

}