package go.crypto.mldsa;

/**
    Options contains additional options for signing and verifying ML-DSA signatures.
**/
@:structInit
@:go.Type({ name: "Options", instanceName: "mldsa.Options", imports: ["crypto/mldsa"] })
extern class Options {

    @:native("Context") var context: String;

    function new(context: String="");

    /**
        HashFunc returns zero, to implement the [crypto.SignerOpts] interface.
    **/
    @:native("HashFunc") function hashFunc(): (go.crypto.Hash);

}