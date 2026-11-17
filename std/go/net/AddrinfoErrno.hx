package go.net;

@:go.Type({ name: "addrinfoErrno", instanceName: "net.addrinfoErrno", imports: ["net"] })
extern typedef AddrinfoErrno = haxe.extern.EitherType<go.GoInt, {
    @:native("Error") function error(): (String);
    @:native("Temporary") function temporary(): (Bool);
    @:native("Timeout") function timeout(): (Bool);

}>