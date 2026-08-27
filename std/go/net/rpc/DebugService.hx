package go.net.rpc;

@:structInit
@:go.Type({ name: "debugService", instanceName: "rpc.debugService", imports: ["net/rpc"] })
extern class DebugService {

    @:native("Service") var service: go.Pointer<go.net.rpc.Service>;
    @:native("Name") var name: String;
    @:native("Method") var method: go.Slice<go.net.rpc.DebugMethod>;

    function new(service: go.Pointer<go.net.rpc.Service>=null, name: String="", method: go.Slice<go.net.rpc.DebugMethod>=null);

}