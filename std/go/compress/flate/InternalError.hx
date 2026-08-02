package go.compress.flate;

@:go.Type({ name: "InternalError", instanceName: "flate.InternalError", imports: ["compress/flate"] })
extern typedef InternalError = haxe.extern.EitherType<String, {
    @:native("Error") function error(): (String);

}>