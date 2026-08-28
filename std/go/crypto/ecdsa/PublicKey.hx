package go.crypto.ecdsa;

/**
    PublicKey represents an ECDSA public key.
**/
@:structInit
@:go.Type({ name: "PublicKey", instanceName: "ecdsa.PublicKey", imports: ["crypto/ecdsa"] })
extern class PublicKey {

    @:native("Curve") var curve: go.crypto.elliptic.Curve;
    @:native("X") var X: go.Pointer<go.math.big.Int>;
    @:native("Y") var Y: go.Pointer<go.math.big.Int>;

    function new(curve: go.crypto.elliptic.Curve=null, X: go.Pointer<go.math.big.Int>=null, Y: go.Pointer<go.math.big.Int>=null);

    @:go.Tuple("x", "y") @:native("Add") function add(x1: go.Pointer<go.math.big.Int>, y1: go.Pointer<go.math.big.Int>, x2: go.Pointer<go.math.big.Int>, y2: go.Pointer<go.math.big.Int>): (go.Tuple<{ x: go.Pointer<go.math.big.Int>, y: go.Pointer<go.math.big.Int> }>);
    /**
        Bytes encodes the public key as an uncompressed point according to SEC 1,
        Version 2.0, Section 2.3.3 (also known as the X9.62 uncompressed format).
        It returns an error if the public key is invalid.
        
        PublicKey.Curve must be one of [elliptic.P224], [elliptic.P256],
        [elliptic.P384], or [elliptic.P521], or Bytes returns an error.
        
        Bytes returns the same format as [ecdh.PublicKey.Bytes] does for NIST curves.
        
        Note that public keys are more commonly encoded in DER (or PEM) format, which
        can be generated with [crypto/x509.MarshalPKIXPublicKey] (and [encoding/pem]).
    **/
    @:native("Bytes") function bytes(): (go.Result<go.Slice<go.Byte>>);
    @:go.Tuple("x", "y") @:native("Double") function double(x1: go.Pointer<go.math.big.Int>, y1: go.Pointer<go.math.big.Int>): (go.Tuple<{ x: go.Pointer<go.math.big.Int>, y: go.Pointer<go.math.big.Int> }>);
    /**
        ECDH returns k as a [ecdh.PublicKey]. It returns an error if the key is
        invalid according to the definition of [ecdh.Curve.NewPublicKey], or if the
        Curve is not supported by crypto/ecdh.
    **/
    @:native("ECDH") function ECDH(): (go.Result<go.Pointer<go.crypto.ecdh.PublicKey>>);
    /**
        Equal reports whether pub and x have the same value.
        
        Two keys are only considered to have the same value if they have the same Curve value.
        Note that for example [elliptic.P256] and elliptic.P256().Params() are different
        values, as the latter is a generic not constant time implementation.
    **/
    @:native("Equal") function equal(x: go.crypto.PublicKey): (Bool);
    @:native("IsOnCurve") function isOnCurve(x: go.Pointer<go.math.big.Int>, y: go.Pointer<go.math.big.Int>): (Bool);
    @:native("Params") function params(): (go.Pointer<go.crypto.elliptic.CurveParams>);
    @:go.Tuple("x", "y") @:native("ScalarBaseMult") function scalarBaseMult(k: go.Slice<go.Byte>): (go.Tuple<{ x: go.Pointer<go.math.big.Int>, y: go.Pointer<go.math.big.Int> }>);
    @:go.Tuple("x", "y") @:native("ScalarMult") function scalarMult(x1: go.Pointer<go.math.big.Int>, y1: go.Pointer<go.math.big.Int>, k: go.Slice<go.Byte>): (go.Tuple<{ x: go.Pointer<go.math.big.Int>, y: go.Pointer<go.math.big.Int> }>);

}