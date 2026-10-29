package go.flag;

@:go.Type({ name: "boolFuncValue", instanceName: "flag.boolFuncValue", imports: ["flag"] })
extern typedef BoolFuncValue = haxe.extern.EitherType<(p0: std.String) -> (go.Error), {
    @:native("IsBoolFlag") function isBoolFlag(): (Bool);
    @:native("Set") function set(s: std.String): (go.Error);
    @:native("String") function string(): (std.String);

}>