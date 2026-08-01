package go.encoding.base32;

@:go.Type({ name: "CorruptInputError", instanceName: "base32.CorruptInputError", imports: ["encoding/base32"] })
extern typedef CorruptInputError = haxe.extern.EitherType<go.Int64, {
    @:native("Error") function error(): (String);

}>