package go.net.rpc;

@:structInit
@:go.Type({ name: "debugMethod", instanceName: "rpc.debugMethod", imports: ["net/rpc"] })
extern class DebugMethod {

    @:native("Type") var type: go.Pointer<go.net.rpc.MethodType>;
    @:native("Name") var name: String;

    function new(type: go.Pointer<go.net.rpc.MethodType>=null, name: String="");

}