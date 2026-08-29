package go.crypto.ed25519;

/**
    PrivateKey is the type of Ed25519 private keys. It implements [crypto.Signer].
**/
@:go.Type({ name: "PrivateKey", instanceName: "ed25519.PrivateKey", imports: ["crypto/ed25519"] })
extern class PrivateKey {

    /**
        Equal reports whether priv and x have the same value.
    **/
    @:native("Equal") function equal(x: go.crypto.PrivateKey): (Bool);
    /**
        Public returns the [PublicKey] corresponding to priv.
    **/
    @:native("Public") function _public(): (go.crypto.PublicKey);
    /**
        Seed returns the private key seed corresponding to priv. It is provided for
        interoperability with RFC 8032. RFC 8032's private keys correspond to seeds
        in this package.
    **/
    @:native("Seed") function seed(): (go.Slice<go.Byte>);
    /**
        Sign signs the given message with priv. rand is ignored and can be nil.
        
        If opts.HashFunc() is [crypto.SHA512], the pre-hashed variant Ed25519ph is used
        and message is expected to be a SHA-512 hash, otherwise opts.HashFunc() must
        be [crypto.Hash](0) and the message must not be hashed, as Ed25519 performs two
        passes over messages to be signed.
        
        A value of type [Options] can be used as opts, or crypto.Hash(0) or
        crypto.SHA512 directly to select plain Ed25519 or Ed25519ph, respectively.
    **/
    @:native("Sign") function sign(rand: go.io.Reader, message: go.Slice<go.Byte>, opts: go.crypto.SignerOpts): (go.Result<go.Slice<go.Byte>>);

}