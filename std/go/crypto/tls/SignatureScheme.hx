package go.crypto.tls;

/**
    SignatureScheme identifies a signature algorithm supported by TLS. See
    RFC 8446, Section 4.2.3.
**/
@:go.Type({ name: "SignatureScheme", instanceName: "tls.SignatureScheme", imports: ["crypto/tls"] })
extern typedef SignatureScheme = haxe.extern.EitherType<go.UInt16, {
    @:native("String") function string(): (String);

}>