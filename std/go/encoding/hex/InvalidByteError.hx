package go.encoding.hex;

@:go.Type({ name: "InvalidByteError", instanceName: "hex.InvalidByteError", imports: ["encoding/hex"] })
extern typedef InvalidByteError = haxe.extern.EitherType<go.Byte, {
    @:native("Error") function error(): (String);

}>