package go.compress.flate;

@:go.Type({ name: "CorruptInputError", instanceName: "flate.CorruptInputError", imports: ["compress/flate"] })
extern typedef CorruptInputError = haxe.extern.EitherType<go.Int64, {
    @:native("Error") function error(): (String);

}>