package go.flag;

@:go.Type({ name: "funcValue", instanceName: "flag.funcValue", imports: ["flag"] })
extern typedef FuncValue = haxe.extern.EitherType<(p0: std.String) -> (go.Error), {
    @:native("Set") function set(s: std.String): (go.Error);
    @:native("String") function string(): (std.String);

}>