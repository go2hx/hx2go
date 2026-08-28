package go.crypto.x509;

/**
    ExtKeyUsage represents an extended set of actions that are valid for a given key.
    Each of the ExtKeyUsage* constants define a unique action.
**/
@:go.Type({ name: "ExtKeyUsage", instanceName: "x509.ExtKeyUsage", imports: ["crypto/x509"] })
extern typedef ExtKeyUsage = haxe.extern.EitherType<go.GoInt, {
    /**
        OID returns the ASN.1 object identifier of the EKU.
    **/
    @:native("OID") function OID(): (go.crypto.x509.OID);
    @:native("String") function string(): (String);

}>