package go.net.rpc;

@:structInit
@:go.Type({ name: "Client", instanceName: "rpc.Client", imports: ["net/rpc"] })
extern class Client {

    @:native("Call") function call(serviceMethod: String, args: Dynamic, reply: Dynamic): go.Error;
    @:native("Close") function close(): go.Error;
    @:native("Go") function go(serviceMethod: String, args: Dynamic, reply: Dynamic, done: go.Chan<go.Pointer<go.net.rpc.Call>>): go.Pointer<go.net.rpc.Call>;

}