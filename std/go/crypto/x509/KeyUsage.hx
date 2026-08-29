package go.crypto.x509;

/**
    KeyUsage represents the set of actions that are valid for a given key. It's
    a bitmap of the KeyUsage* constants.
**/
@:go.Type({ name: "KeyUsage", instanceName: "x509.KeyUsage", imports: ["crypto/x509"] })
extern typedef KeyUsage = haxe.extern.EitherType<go.GoInt, {
    @:native("String") function string(): (String);

}>