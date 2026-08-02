package go.crypto.x509;

@:go.Type({ name: "SignatureAlgorithm", instanceName: "x509.SignatureAlgorithm", imports: ["crypto/x509"] })
extern typedef SignatureAlgorithm = haxe.extern.EitherType<go.GoInt, {
    @:native("String") function string(): (String);

}>