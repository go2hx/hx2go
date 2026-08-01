package go.encoding.ascii85;

@:go.Type({ name: "CorruptInputError", instanceName: "ascii85.CorruptInputError", imports: ["encoding/ascii85"] })
extern typedef CorruptInputError = haxe.extern.EitherType<go.Int64, {
    @:native("Error") function error(): (String);

}>