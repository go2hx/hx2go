package go.net.rpc;

@:go.Type({ name: "ServerError", instanceName: "rpc.ServerError", imports: ["net/rpc"] })
extern typedef ServerError = haxe.extern.EitherType<String, {
    @:native("Error") function error(): (String);

}>