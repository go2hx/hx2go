package go.crypto.ecdsa;

/**
    PrivateKey represents an ECDSA private key.
**/
@:structInit
@:go.Type({ name: "PrivateKey", instanceName: "ecdsa.PrivateKey", imports: ["crypto/ecdsa"] })
extern class PrivateKey {

    @:native("PublicKey") var publicKey: go.crypto.ecdsa.PublicKey;
    @:native("D") var D: go.Pointer<go.math.big.Int>;
    @:native("Curve") var curve: go.crypto.elliptic.Curve;
    @:native("X") var X: go.Pointer<go.math.big.Int>;
    @:native("Y") var Y: go.Pointer<go.math.big.Int>;

    function new(publicKey: go.crypto.ecdsa.PublicKey, D: go.Pointer<go.math.big.Int>=null);

    @:go.Tuple("x", "y") @:native("Add") function add(x1: go.Pointer<go.math.big.Int>, y1: go.Pointer<go.math.big.Int>, x2: go.Pointer<go.math.big.Int>, y2: go.Pointer<go.math.big.Int>): (go.Tuple<{ x: go.Pointer<go.math.big.Int>, y: go.Pointer<go.math.big.Int> }>);
    /**
        Bytes encodes the private key as a fixed-length big-endian integer according
        to SEC 1, Version 2.0, Section 2.3.6 (sometimes referred to as the raw
        format). It returns an error if the private key is invalid.
        
        PrivateKey.Curve must be one of [elliptic.P224], [elliptic.P256],
        [elliptic.P384], or [elliptic.P521], or Bytes returns an error.
        
        Bytes returns the same format as [ecdh.PrivateKey.Bytes] does for NIST curves.
        
        Note that private keys are more commonly encoded in ASN.1 or PKCS#8 format,
        which can be generated with [crypto/x509.MarshalECPrivateKey] or
        [crypto/x509.MarshalPKCS8PrivateKey] (and [encoding/pem]).
    **/
    @:native("Bytes") function bytes(): (go.Result<go.Slice<go.Byte>>);
    @:go.Tuple("x", "y") @:native("Double") function double(x1: go.Pointer<go.math.big.Int>, y1: go.Pointer<go.math.big.Int>): (go.Tuple<{ x: go.Pointer<go.math.big.Int>, y: go.Pointer<go.math.big.Int> }>);
    /**
        ECDH returns k as a [ecdh.PrivateKey]. It returns an error if the key is
        invalid according to the definition of [ecdh.Curve.NewPrivateKey], or if the
        Curve is not supported by [crypto/ecdh].
    **/
    @:native("ECDH") function ECDH(): (go.Result<go.Pointer<go.crypto.ecdh.PrivateKey>>);
    /**
        Equal reports whether priv and x have the same value.
        
        See [PublicKey.Equal] for details on how Curve is compared.
    **/
    @:native("Equal") function equal(x: go.crypto.PrivateKey): (Bool);
    @:native("IsOnCurve") function isOnCurve(x: go.Pointer<go.math.big.Int>, y: go.Pointer<go.math.big.Int>): (Bool);
    @:native("Params") function params(): (go.Pointer<go.crypto.elliptic.CurveParams>);
    /**
        Public returns the public key corresponding to priv.
    **/
    @:native("Public") function _public(): (go.crypto.PublicKey);
    @:go.Tuple("x", "y") @:native("ScalarBaseMult") function scalarBaseMult(k: go.Slice<go.Byte>): (go.Tuple<{ x: go.Pointer<go.math.big.Int>, y: go.Pointer<go.math.big.Int> }>);
    @:go.Tuple("x", "y") @:native("ScalarMult") function scalarMult(x1: go.Pointer<go.math.big.Int>, y1: go.Pointer<go.math.big.Int>, k: go.Slice<go.Byte>): (go.Tuple<{ x: go.Pointer<go.math.big.Int>, y: go.Pointer<go.math.big.Int> }>);
    /**
        Sign signs a hash (which should be the result of hashing a larger message
        with opts.HashFunc()) using the private key, priv. If the hash is longer than
        the bit-length of the private key's curve order, the hash will be truncated
        to that length. It returns the ASN.1 encoded signature, like [SignASN1].
        
        If random is not nil, the signature is randomized. Most applications should use
        [crypto/rand.Reader] as random, but unless GODEBUG=cryptocustomrand=1 is set, a
        secure source of random bytes is always used, and the actual Reader is ignored.
        The GODEBUG setting will be removed in a future Go release. Instead, use
        [testing/cryptotest.SetGlobalRandom].
        
        If random is nil, Sign will produce a deterministic signature according to RFC
        6979. When producing a deterministic signature, opts.HashFunc() must be the
        function used to produce digest and priv.Curve must be one of
        [elliptic.P224], [elliptic.P256], [elliptic.P384], or [elliptic.P521].
    **/
    @:native("Sign") function sign(random: go.io.Reader, digest: go.Slice<go.Byte>, opts: go.crypto.SignerOpts): (go.Result<go.Slice<go.Byte>>);

}