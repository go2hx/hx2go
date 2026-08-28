package go.net.rpc;

/**
    Call represents an active RPC.
**/
@:structInit
@:go.Type({ name: "Call", instanceName: "rpc.Call", imports: ["net/rpc"] })
extern class Call {

    @:native("ServiceMethod") var serviceMethod: String;
    @:native("Args") var args: Dynamic;
    @:native("Reply") var reply: Dynamic;
    @:native("Error") var error: go.Error;
    @:native("Done") var done: go.Chan<go.Pointer<go.net.rpc.Call>>;

    function new(serviceMethod: String="", args: Dynamic=null, reply: Dynamic=null, error: go.Error=null, done: go.Chan<go.Pointer<go.net.rpc.Call>>=null);

}