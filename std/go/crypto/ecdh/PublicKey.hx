package go.crypto.ecdh;

/**
    PublicKey is an ECDH public key, usually a peer's ECDH share sent over the wire.
    
    These keys can be parsed with [crypto/x509.ParsePKIXPublicKey] and encoded
    with [crypto/x509.MarshalPKIXPublicKey]. For NIST curves, they then need to
    be converted with [crypto/ecdsa.PublicKey.ECDH] after parsing.
**/
@:structInit
@:go.Type({ name: "PublicKey", instanceName: "ecdh.PublicKey", imports: ["crypto/ecdh"] })
extern class PublicKey {

    /**
        Bytes returns a copy of the encoding of the public key.
    **/
    @:native("Bytes") function bytes(): (go.Slice<go.Byte>);
    @:native("Curve") function curve(): (go.crypto.ecdh.Curve);
    /**
        Equal returns whether x represents the same public key as k.
        
        Note that there can be equivalent public keys with different encodings which
        would return false from this check but behave the same way as inputs to ECDH.
        
        This check is performed in constant time as long as the key types and their
        curve match.
    **/
    @:native("Equal") function equal(x: go.crypto.PublicKey): (Bool);

}