package go.crypto;

/**
    Package mldsa implements the post-quantum ML-DSA signature scheme specified
    in [FIPS 204].
    
    This package is unavailable if using the [FIPS 140-3 Go Cryptographic Module]
    v1.0.0, in which case [GenerateKey], [NewPrivateKey], [NewPublicKey], and
    [Verify] will return an error. It is available if using v1.26.0 or later.
    
    [FIPS 204]: https://nvlpubs.nist.gov/nistpubs/FIPS/NIST.FIPS.204.pdf
    [FIPS 140-3 Go Cryptographic Module]: https://go.dev/doc/security/fips140
**/
@:go.Type({ name: "mldsa", instanceName: "mldsa.mldsa", imports: ["crypto/mldsa"] })
extern class Mldsa {

    @:native("MLDSA44PublicKeySize") static var mLDSA44PublicKeySize: go.GoInt;
    @:native("MLDSA44SignatureSize") static var mLDSA44SignatureSize: go.GoInt;
    @:native("MLDSA65PublicKeySize") static var mLDSA65PublicKeySize: go.GoInt;
    @:native("MLDSA65SignatureSize") static var mLDSA65SignatureSize: go.GoInt;
    @:native("MLDSA87PublicKeySize") static var mLDSA87PublicKeySize: go.GoInt;
    @:native("MLDSA87SignatureSize") static var mLDSA87SignatureSize: go.GoInt;
    @:native("PrivateKeySize") static var privateKeySize: go.GoInt;

    /**
        GenerateKey generates a new random ML-DSA private key.
    **/
    @:native("GenerateKey") static function generateKey(params: go.crypto.mldsa.Parameters): (go.Result<go.Pointer<go.crypto.mldsa.PrivateKey>>);
    /**
        MLDSA44 returns the ML-DSA-44 parameter set defined in FIPS 204.
    **/
    @:native("MLDSA44") static function MLDSA44(): (go.crypto.mldsa.Parameters);
    /**
        MLDSA65 returns the ML-DSA-65 parameter set defined in FIPS 204.
    **/
    @:native("MLDSA65") static function MLDSA65(): (go.crypto.mldsa.Parameters);
    /**
        MLDSA87 returns the ML-DSA-87 parameter set defined in FIPS 204.
    **/
    @:native("MLDSA87") static function MLDSA87(): (go.crypto.mldsa.Parameters);
    /**
        NewPrivateKey decodes an ML-DSA private key from the given seed.
        
        The seed must be exactly [PrivateKeySize] bytes long.
    **/
    @:native("NewPrivateKey") static function newPrivateKey(params: go.crypto.mldsa.Parameters, seed: go.Slice<go.Byte>): (go.Result<go.Pointer<go.crypto.mldsa.PrivateKey>>);
    /**
        NewPublicKey creates a new ML-DSA public key from the given encoding.
    **/
    @:native("NewPublicKey") static function newPublicKey(params: go.crypto.mldsa.Parameters, encoding: go.Slice<go.Byte>): (go.Result<go.Pointer<go.crypto.mldsa.PublicKey>>);
    /**
        Verify reports whether signature is a valid signature of message by pk.
        If opts is nil, it's equivalent to the zero value of Options.
    **/
    @:native("Verify") static function verify(pk: go.Pointer<go.crypto.mldsa.PublicKey>, message: go.Slice<go.Byte>, signature: go.Slice<go.Byte>, opts: go.Pointer<go.crypto.mldsa.Options>): (go.Error);

}