package go.os;

@:go.Type({ name: "errSymlink", instanceName: "os.errSymlink", imports: ["os"] })
extern typedef ErrSymlink = haxe.extern.EitherType<String, {
    @:native("Error") function error(): (String);

}>