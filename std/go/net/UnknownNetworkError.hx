package go.net;

@:go.Type({ name: "UnknownNetworkError", instanceName: "net.UnknownNetworkError", imports: ["net"] })
extern typedef UnknownNetworkError = haxe.extern.EitherType<String, {
    @:native("Error") function error(): (String);
    @:native("Temporary") function temporary(): (Bool);
    @:native("Timeout") function timeout(): (Bool);

}>