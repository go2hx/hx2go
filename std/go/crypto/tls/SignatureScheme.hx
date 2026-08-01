package go.crypto.tls;

@:go.Type({ name: "SignatureScheme", instanceName: "tls.SignatureScheme", imports: ["crypto/tls"] })
extern typedef SignatureScheme = haxe.extern.EitherType<go.UInt16, {
    @:native("String") function string(): (String);

}>