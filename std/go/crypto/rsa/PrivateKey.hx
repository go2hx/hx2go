package go.crypto.rsa;

/**
    A PrivateKey represents an RSA key.
    
    Its fields must not be modified after calling [PrivateKey.Precompute], and
    should not be used directly as big.Int values for cryptographic purposes.
**/
@:structInit
@:go.Type({ name: "PrivateKey", instanceName: "rsa.PrivateKey", imports: ["crypto/rsa"] })
extern class PrivateKey {

    @:native("PublicKey") var publicKey: go.crypto.rsa.PublicKey;
    @:native("D") var D: go.Pointer<go.math.big.Int>;
    @:native("Primes") var primes: go.Slice<go.Pointer<go.math.big.Int>>;
    @:native("Precomputed") var precomputed: go.crypto.rsa.PrecomputedValues;
    @:native("N") var N: go.Pointer<go.math.big.Int>;
    @:native("E") var E: go.GoInt;

    function new(publicKey: go.crypto.rsa.PublicKey, D: go.Pointer<go.math.big.Int>=null, primes: go.Slice<go.Pointer<go.math.big.Int>>=null, precomputed: go.crypto.rsa.PrecomputedValues);

    /**
        Decrypt decrypts ciphertext with priv. If opts is nil or of type
        *[PKCS1v15DecryptOptions] then PKCS #1 v1.5 decryption is performed. Otherwise
        opts must have type *[OAEPOptions] and OAEP decryption is done.
    **/
    @:native("Decrypt") function decrypt(rand: go.io.Reader, ciphertext: go.Slice<go.Byte>, opts: go.crypto.DecrypterOpts): (go.Result<go.Slice<go.Byte>>);
    /**
        Equal reports whether priv and x have equivalent values. It ignores
        Precomputed values.
    **/
    @:native("Equal") function equal(x: go.crypto.PrivateKey): (Bool);
    /**
        Precompute performs some calculations that speed up private key operations
        in the future. It is safe to run on non-validated private keys.
    **/
    @:native("Precompute") function precompute(): Void;
    /**
        Public returns the public key corresponding to priv.
    **/
    @:native("Public") function _public(): (go.crypto.PublicKey);
    /**
        Sign signs digest with priv, reading randomness from rand. If opts is a
        *[PSSOptions] then the PSS algorithm will be used, otherwise PKCS #1 v1.5 will
        be used. digest must be the result of hashing the input message using
        opts.HashFunc().
        
        This method implements [crypto.Signer], which is an interface to support keys
        where the private part is kept in, for example, a hardware module. Common
        uses should use the Sign* functions in this package directly.
    **/
    @:native("Sign") function sign(rand: go.io.Reader, digest: go.Slice<go.Byte>, opts: go.crypto.SignerOpts): (go.Result<go.Slice<go.Byte>>);
    @:native("Size") function size(): (go.GoInt);
    /**
        Validate performs basic sanity checks on the key.
        It returns nil if the key is valid, or else an error describing a problem.
        
        It runs faster on valid keys if run after [PrivateKey.Precompute].
    **/
    @:native("Validate") function validate(): (go.Error);

}