package go.crypto.x509;

@:go.Type({ name: "ExtKeyUsage", instanceName: "x509.ExtKeyUsage", imports: ["crypto/x509"] })
extern typedef ExtKeyUsage = haxe.extern.EitherType<go.GoInt, {
    @:native("OID") function OID(): (go.crypto.x509.OID);
    @:native("String") function string(): (String);

}>