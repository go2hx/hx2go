package go.crypto.mldsa;

/**
    PrivateKey is an in-memory ML-DSA private key. It implements [crypto.Signer]
    and the informal extended [crypto.PrivateKey] interface.
    
    A PrivateKey is safe for concurrent use.
**/
@:structInit
@:go.Type({ name: "PrivateKey", instanceName: "mldsa.PrivateKey", imports: ["crypto/mldsa"] })
extern class PrivateKey {

    /**
        Bytes returns the private key seed.
    **/
    @:native("Bytes") function bytes(): (go.Slice<go.Byte>);
    /**
        Equal reports whether sk and x are the same key (i.e. they are derived from
        the same seed).
        
        If x is not a *PrivateKey, Equal returns false.
    **/
    @:native("Equal") function equal(x: go.crypto.PrivateKey): (Bool);
    /**
        Public returns the corresponding [PublicKey] for this private key.
        
        It implements the [crypto.Signer] interface.
    **/
    @:native("Public") function _public(): (go.crypto.PublicKey);
    /**
        PublicKey returns the corresponding [PublicKey] for this private key.
    **/
    @:native("PublicKey") function publicKey(): (go.Pointer<go.crypto.mldsa.PublicKey>);
    /**
        Sign returns a signature of the given message using this private key.
        
        If opts is nil or opts.HashFunc returns zero, the message is signed directly.
        If opts.HashFunc returns [crypto.MLDSAMu], the provided message must be a
        [pre-hashed μ message representative]. opts can be of type *[Options] if a
        context string is desired along with a directly-signed message. The io.Reader
        argument is ignored.
        
        [pre-hashed μ message representative]: https://www.rfc-editor.org/rfc/rfc9881.html#externalmu
    **/
    @:native("Sign") function sign(_: go.io.Reader, message: go.Slice<go.Byte>, opts: go.crypto.SignerOpts): (go.Result<go.Slice<go.Byte>>);
    /**
        SignDeterministic works like [PrivateKey.Sign], but the signature is
        deterministic.
    **/
    @:native("SignDeterministic") function signDeterministic(message: go.Slice<go.Byte>, opts: go.crypto.SignerOpts): (go.Result<go.Slice<go.Byte>>);

}