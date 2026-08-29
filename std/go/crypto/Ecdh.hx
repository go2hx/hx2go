package go.crypto;

/**
    Package ecdh implements Elliptic Curve Diffie-Hellman over
    NIST curves and Curve25519.
**/
@:go.Type({ name: "ecdh", instanceName: "ecdh.ecdh", imports: ["crypto/ecdh"] })
extern class Ecdh {

    /**
        P256 returns a [Curve] which implements NIST P-256 (FIPS 186-3, section D.2.3),
        also known as secp256r1 or prime256v1.
        
        Multiple invocations of this function will return the same value, which can
        be used for equality checks and switch statements.
    **/
    @:native("P256") static function P256(): (go.crypto.ecdh.Curve);
    /**
        P384 returns a [Curve] which implements NIST P-384 (FIPS 186-3, section D.2.4),
        also known as secp384r1.
        
        Multiple invocations of this function will return the same value, which can
        be used for equality checks and switch statements.
    **/
    @:native("P384") static function P384(): (go.crypto.ecdh.Curve);
    /**
        P521 returns a [Curve] which implements NIST P-521 (FIPS 186-3, section D.2.5),
        also known as secp521r1.
        
        Multiple invocations of this function will return the same value, which can
        be used for equality checks and switch statements.
    **/
    @:native("P521") static function P521(): (go.crypto.ecdh.Curve);
    /**
        X25519 returns a [Curve] which implements the X25519 function over Curve25519
        (RFC 7748, Section 5).
        
        Multiple invocations of this function will return the same value, so it can
        be used for equality checks and switch statements.
    **/
    @:native("X25519") static function X25519(): (go.crypto.ecdh.Curve);

}