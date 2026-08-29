package go.encoding.hex;

/**
    InvalidByteError values describe errors resulting from an invalid byte in a hex string.
**/
@:go.Type({ name: "InvalidByteError", instanceName: "hex.InvalidByteError", imports: ["encoding/hex"] })
extern typedef InvalidByteError = haxe.extern.EitherType<go.Byte, {
    @:native("Error") function error(): (String);

}>