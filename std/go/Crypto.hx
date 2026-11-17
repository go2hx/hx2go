package go;

/**
    Package crypto collects common cryptographic constants.
**/
@:go.Type({ name: "crypto", instanceName: "crypto.crypto", imports: ["crypto"] })
extern class Crypto {

    @:native("BLAKE2b_256") static final bLAKE2b_256: go.crypto.Hash;
    @:native("BLAKE2b_384") static final bLAKE2b_384: go.crypto.Hash;
    @:native("BLAKE2b_512") static final bLAKE2b_512: go.crypto.Hash;
    @:native("BLAKE2s_256") static final bLAKE2s_256: go.crypto.Hash;
    @:native("MD4") static final MD4: go.crypto.Hash;
    @:native("MD5") static final MD5: go.crypto.Hash;
    @:native("MD5SHA1") static final MD5SHA1: go.crypto.Hash;
    @:native("MLDSAMu") static final mLDSAMu: go.crypto.Hash;
    @:native("RIPEMD160") static final RIPEMD160: go.crypto.Hash;
    @:native("SHA1") static final SHA1: go.crypto.Hash;
    @:native("SHA224") static final SHA224: go.crypto.Hash;
    @:native("SHA256") static final SHA256: go.crypto.Hash;
    @:native("SHA384") static final SHA384: go.crypto.Hash;
    @:native("SHA3_224") static final SHA3_224: go.crypto.Hash;
    @:native("SHA3_256") static final SHA3_256: go.crypto.Hash;
    @:native("SHA3_384") static final SHA3_384: go.crypto.Hash;
    @:native("SHA3_512") static final SHA3_512: go.crypto.Hash;
    @:native("SHA512") static final SHA512: go.crypto.Hash;
    @:native("SHA512_224") static final SHA512_224: go.crypto.Hash;
    @:native("SHA512_256") static final SHA512_256: go.crypto.Hash;

    /**
        RegisterHash registers a function that returns a new instance of the given
        hash function. This is intended to be called from the init function in
        packages that implement hash functions.
    **/
    @:native("RegisterHash") static function registerHash(h: go.crypto.Hash, f: () -> (go.hash.Hash)): Void;
    /**
        SignMessage signs msg with signer. If signer implements [MessageSigner],
        [MessageSigner.SignMessage] is called directly. Otherwise, msg is hashed
        with opts.HashFunc() and signed with [Signer.Sign].
    **/
    @:native("SignMessage") static function signMessage(signer: go.crypto.Signer, rand: go.io.Reader, msg: go.Slice<go.Byte>, opts: go.crypto.SignerOpts): (go.Result<go.Slice<go.Byte>>);

}