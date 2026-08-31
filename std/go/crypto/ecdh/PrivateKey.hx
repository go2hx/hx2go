package go.crypto.ecdh;

/**
    PrivateKey is an ECDH private key, usually kept secret.
    
    These keys can be parsed with [crypto/x509.ParsePKCS8PrivateKey] and encoded
    with [crypto/x509.MarshalPKCS8PrivateKey]. For NIST curves, they then need to
    be converted with [crypto/ecdsa.PrivateKey.ECDH] after parsing.
**/
@:structInit
@:go.Type({ name: "PrivateKey", instanceName: "ecdh.PrivateKey", imports: ["crypto/ecdh"] })
extern class PrivateKey {

    /**
        Bytes returns a copy of the encoding of the private key.
    **/
    @:native("Bytes") function bytes(): (go.Slice<go.Byte>);
    @:native("Curve") function curve(): (go.crypto.ecdh.Curve);
    /**
        ECDH performs an ECDH exchange and returns the shared secret. The [PrivateKey]
        and [PublicKey] must use the same curve.
        
        For NIST curves, this performs ECDH as specified in SEC 1, Version 2.0,
        Section 3.3.1, and returns the x-coordinate encoded according to SEC 1,
        Version 2.0, Section 2.3.5. The result is never the point at infinity.
        This is also known as the Shared Secret Computation of the Ephemeral Unified
        Model scheme specified in NIST SP 800-56A Rev. 3, Section 6.1.2.2.
        
        For [X25519], this performs ECDH as specified in RFC 7748, Section 6.1. If
        the result is the all-zero value, ECDH returns an error.
    **/
    @:native("ECDH") function ECDH(remote: go.Pointer<go.crypto.ecdh.PublicKey>): (go.Result<go.Slice<go.Byte>>);
    /**
        Equal returns whether x represents the same private key as k.
        
        Note that there can be equivalent private keys with different encodings which
        would return false from this check but behave the same way as inputs to [ECDH].
        
        This check is performed in constant time as long as the key types and their
        curve match.
    **/
    @:native("Equal") function equal(x: go.crypto.PrivateKey): (Bool);
    /**
        Public implements the implicit interface of all standard library private
        keys. See the docs of [crypto.PrivateKey].
    **/
    @:native("Public") function _public(): (go.crypto.PublicKey);
    @:native("PublicKey") function publicKey(): (go.Pointer<go.crypto.ecdh.PublicKey>);

}