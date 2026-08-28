package go.compress.flate;

/**
    An InternalError reports an error in the flate code itself.
**/
@:go.Type({ name: "InternalError", instanceName: "flate.InternalError", imports: ["compress/flate"] })
extern typedef InternalError = haxe.extern.EitherType<String, {
    @:native("Error") function error(): (String);

}>