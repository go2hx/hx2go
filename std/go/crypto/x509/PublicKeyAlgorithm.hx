package go.crypto.x509;

@:go.Type({ name: "PublicKeyAlgorithm", instanceName: "x509.PublicKeyAlgorithm", imports: ["crypto/x509"] })
extern typedef PublicKeyAlgorithm = haxe.extern.EitherType<go.GoInt, {
    @:native("String") function string(): (String);

}>