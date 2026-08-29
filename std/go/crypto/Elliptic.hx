package go.crypto;

/**
    Package elliptic implements the standard NIST P-224, P-256, P-384, and P-521
    elliptic curves over prime fields.
    
    Direct use of this package is deprecated, beyond the [P224], [P256], [P384],
    and [P521] values necessary to use [crypto/ecdsa]. Most other uses
    should migrate to the more efficient and safer [crypto/ecdh], or to
    third-party modules for lower-level functionality.
**/
@:go.Type({ name: "elliptic", instanceName: "elliptic.elliptic", imports: ["crypto/elliptic"] })
extern class Elliptic {

    /**
        GenerateKey returns a public/private key pair. The private key is
        generated using the given reader, which must return random data.
        
        Deprecated: for ECDH, use the GenerateKey methods of the [crypto/ecdh] package;
        for ECDSA, use the GenerateKey function of the crypto/ecdsa package.
    **/
    @:go.Tuple("priv", "x", "y", "err") @:native("GenerateKey") static function generateKey(curve: go.crypto.elliptic.Curve, rand: go.io.Reader): (go.Tuple<{ priv: go.Slice<go.Byte>, x: go.Pointer<go.math.big.Int>, y: go.Pointer<go.math.big.Int>, err: go.Error }>);
    /**
        Marshal converts a point on the curve into the uncompressed form specified in
        SEC 1, Version 2.0, Section 2.3.3. If the point is not on the curve (or is
        the conventional point at infinity), the behavior is undefined.
        
        Deprecated: for ECDH, use the crypto/ecdh package. This function returns an
        encoding equivalent to that of PublicKey.Bytes in crypto/ecdh.
    **/
    @:native("Marshal") static function marshal(curve: go.crypto.elliptic.Curve, x: go.Pointer<go.math.big.Int>, y: go.Pointer<go.math.big.Int>): (go.Slice<go.Byte>);
    /**
        MarshalCompressed converts a point on the curve into the compressed form
        specified in SEC 1, Version 2.0, Section 2.3.3. If the point is not on the
        curve (or is the conventional point at infinity), the behavior is undefined.
    **/
    @:native("MarshalCompressed") static function marshalCompressed(curve: go.crypto.elliptic.Curve, x: go.Pointer<go.math.big.Int>, y: go.Pointer<go.math.big.Int>): (go.Slice<go.Byte>);
    /**
        P224 returns a [Curve] which implements NIST P-224 (FIPS 186-3, section D.2.2),
        also known as secp224r1. The CurveParams.Name of this [Curve] is "P-224".
        
        Multiple invocations of this function will return the same value, so it can
        be used for equality checks and switch statements.
        
        The cryptographic operations are implemented using constant-time algorithms.
    **/
    @:native("P224") static function P224(): (go.crypto.elliptic.Curve);
    /**
        P256 returns a [Curve] which implements NIST P-256 (FIPS 186-3, section D.2.3),
        also known as secp256r1 or prime256v1. The CurveParams.Name of this [Curve] is
        "P-256".
        
        Multiple invocations of this function will return the same value, so it can
        be used for equality checks and switch statements.
        
        The cryptographic operations are implemented using constant-time algorithms.
    **/
    @:native("P256") static function P256(): (go.crypto.elliptic.Curve);
    /**
        P384 returns a [Curve] which implements NIST P-384 (FIPS 186-3, section D.2.4),
        also known as secp384r1. The CurveParams.Name of this [Curve] is "P-384".
        
        Multiple invocations of this function will return the same value, so it can
        be used for equality checks and switch statements.
        
        The cryptographic operations are implemented using constant-time algorithms.
    **/
    @:native("P384") static function P384(): (go.crypto.elliptic.Curve);
    /**
        P521 returns a [Curve] which implements NIST P-521 (FIPS 186-3, section D.2.5),
        also known as secp521r1. The CurveParams.Name of this [Curve] is "P-521".
        
        Multiple invocations of this function will return the same value, so it can
        be used for equality checks and switch statements.
        
        The cryptographic operations are implemented using constant-time algorithms.
    **/
    @:native("P521") static function P521(): (go.crypto.elliptic.Curve);
    /**
        Unmarshal converts a point, serialized by [Marshal], into an x, y pair. It is
        an error if the point is not in uncompressed form, is not on the curve, or is
        the point at infinity. On error, x = nil.
        
        Deprecated: for ECDH, use the crypto/ecdh package. This function accepts an
        encoding equivalent to that of the NewPublicKey methods in crypto/ecdh.
    **/
    @:go.Tuple("x", "y") @:native("Unmarshal") static function unmarshal(curve: go.crypto.elliptic.Curve, data: go.Slice<go.Byte>): (go.Tuple<{ x: go.Pointer<go.math.big.Int>, y: go.Pointer<go.math.big.Int> }>);
    /**
        UnmarshalCompressed converts a point, serialized by [MarshalCompressed], into
        an x, y pair. It is an error if the point is not in compressed form, is not
        on the curve, or is the point at infinity. On error, x = nil.
    **/
    @:go.Tuple("x", "y") @:native("UnmarshalCompressed") static function unmarshalCompressed(curve: go.crypto.elliptic.Curve, data: go.Slice<go.Byte>): (go.Tuple<{ x: go.Pointer<go.math.big.Int>, y: go.Pointer<go.math.big.Int> }>);

}