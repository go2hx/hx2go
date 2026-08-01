package go.encoding.base64;

@:go.Type({ name: "CorruptInputError", instanceName: "base64.CorruptInputError", imports: ["encoding/base64"] })
extern typedef CorruptInputError = haxe.extern.EitherType<go.Int64, {
    @:native("Error") function error(): (String);

}>