package go.crypto.rsa;

/**
    PSSOptions contains options for creating and verifying PSS signatures.
**/
@:structInit
@:go.Type({ name: "PSSOptions", instanceName: "rsa.PSSOptions", imports: ["crypto/rsa"] })
extern class PSSOptions {

    @:native("SaltLength") var saltLength: go.GoInt;
    @:native("Hash") var hash: go.crypto.Hash;

    function new(saltLength: go.GoInt=0, hash: go.crypto.Hash=cast 0);

    /**
        HashFunc returns opts.Hash so that [PSSOptions] implements [crypto.SignerOpts].
    **/
    @:native("HashFunc") function hashFunc(): (go.crypto.Hash);

}