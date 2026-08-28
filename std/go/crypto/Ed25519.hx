package go.crypto;

/**
    Package ed25519 implements the Ed25519 signature algorithm. See
    https://ed25519.cr.yp.to/.
    
    These functions are also compatible with the “Ed25519” function defined in
    RFC 8032. However, unlike RFC 8032's formulation, this package's private key
    representation includes a public key suffix to make multiple signing
    operations with the same key more efficient. This package refers to the RFC
    8032 private key as the “seed”.
    
    Operations involving private keys are implemented using constant-time
    algorithms.
**/
@:go.Type({ name: "ed25519", instanceName: "ed25519.ed25519", imports: ["crypto/ed25519"] })
extern class Ed25519 {

    @:native("PrivateKeySize") static var privateKeySize: go.GoInt;
    @:native("PublicKeySize") static var publicKeySize: go.GoInt;
    @:native("SeedSize") static var seedSize: go.GoInt;
    @:native("SignatureSize") static var signatureSize: go.GoInt;

    /**
        GenerateKey generates a public/private key pair using entropy from random.
        
        If random is nil, a secure random source is used. (Before Go 1.26, a custom
        [crypto/rand.Reader] was used if set by the application. That behavior can be
        restored with GODEBUG=cryptocustomrand=1. This setting will be removed in a
        future Go release. Instead, use [testing/cryptotest.SetGlobalRandom].)
        
        The output of this function is deterministic, and equivalent to reading
        [SeedSize] bytes from random, and passing them to [NewKeyFromSeed].
    **/
    @:go.Tuple("p0", "p1", "p2") @:native("GenerateKey") static function generateKey(random: go.io.Reader): (go.Tuple<{ p0: go.crypto.ed25519.PublicKey, p1: go.crypto.ed25519.PrivateKey, p2: go.Error }>);
    /**
        NewKeyFromSeed calculates a private key from a seed. It will panic if
        len(seed) is not [SeedSize]. This function is provided for interoperability
        with RFC 8032. RFC 8032's private keys correspond to seeds in this
        package.
    **/
    @:native("NewKeyFromSeed") static function newKeyFromSeed(seed: go.Slice<go.Byte>): (go.crypto.ed25519.PrivateKey);
    /**
        Sign signs the message with privateKey and returns a signature. It will
        panic if len(privateKey) is not [PrivateKeySize].
    **/
    @:native("Sign") static function sign(privateKey: go.crypto.ed25519.PrivateKey, message: go.Slice<go.Byte>): (go.Slice<go.Byte>);
    /**
        Verify reports whether sig is a valid signature of message by publicKey. It
        will panic if len(publicKey) is not [PublicKeySize].
        
        The inputs are not considered confidential, and may leak through timing side
        channels, or if an attacker has control of part of the inputs.
    **/
    @:native("Verify") static function verify(publicKey: go.crypto.ed25519.PublicKey, message: go.Slice<go.Byte>, sig: go.Slice<go.Byte>): (Bool);
    /**
        VerifyWithOptions reports whether sig is a valid signature of message by
        publicKey. A valid signature is indicated by returning a nil error. It will
        panic if len(publicKey) is not [PublicKeySize].
        
        If opts.Hash is [crypto.SHA512], the pre-hashed variant Ed25519ph is used and
        message is expected to be a SHA-512 hash, otherwise opts.Hash must be
        [crypto.Hash](0) and the message must not be hashed, as Ed25519 performs two
        passes over messages to be signed.
        
        The inputs are not considered confidential, and may leak through timing side
        channels, or if an attacker has control of part of the inputs.
    **/
    @:native("VerifyWithOptions") static function verifyWithOptions(publicKey: go.crypto.ed25519.PublicKey, message: go.Slice<go.Byte>, sig: go.Slice<go.Byte>, opts: go.Pointer<go.crypto.ed25519.Options>): (go.Error);

}