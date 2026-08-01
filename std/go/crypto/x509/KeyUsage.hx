package go.crypto.x509;

@:go.Type({ name: "KeyUsage", instanceName: "x509.KeyUsage", imports: ["crypto/x509"] })
extern typedef KeyUsage = haxe.extern.EitherType<go.GoInt, {
    @:native("String") function string(): (String);

}>