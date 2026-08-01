package go.net;

@:go.Type({ name: "InvalidAddrError", instanceName: "net.InvalidAddrError", imports: ["net"] })
extern typedef InvalidAddrError = haxe.extern.EitherType<String, {
    @:native("Error") function error(): (String);
    @:native("Temporary") function temporary(): (Bool);
    @:native("Timeout") function timeout(): (Bool);

}>