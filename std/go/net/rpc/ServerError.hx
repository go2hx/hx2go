package go.net.rpc;

/**
    ServerError represents an error that has been returned from
    the remote side of the RPC connection.
**/
@:go.Type({ name: "ServerError", instanceName: "rpc.ServerError", imports: ["net/rpc"] })
extern typedef ServerError = haxe.extern.EitherType<String, {
    @:native("Error") function error(): (String);

}>