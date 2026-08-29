package go.compress.flate;

/**
    A CorruptInputError reports the presence of corrupt input at a given offset.
**/
@:go.Type({ name: "CorruptInputError", instanceName: "flate.CorruptInputError", imports: ["compress/flate"] })
extern typedef CorruptInputError = haxe.extern.EitherType<go.Int64, {
    @:native("Error") function error(): (String);

}>