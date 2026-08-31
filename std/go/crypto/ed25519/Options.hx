package go.crypto.ed25519;

/**
    Options can be used with [PrivateKey.Sign] or [VerifyWithOptions]
    to select Ed25519 variants.
**/
@:structInit
@:go.Type({ name: "Options", instanceName: "ed25519.Options", imports: ["crypto/ed25519"] })
extern class Options {

    @:native("Hash") var hash: go.crypto.Hash;
    @:native("Context") var context: String;

    function new(hash: go.crypto.Hash=cast 0, context: String="");

    /**
        HashFunc returns o.Hash.
    **/
    @:native("HashFunc") function hashFunc(): (go.crypto.Hash);

}