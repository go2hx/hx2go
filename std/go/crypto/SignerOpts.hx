package go.crypto;

/**
    SignerOpts contains options for signing with a [Signer].
**/
@:go.Type({ name: "SignerOpts", instanceName: "crypto.SignerOpts", imports: ["crypto"] })
extern typedef SignerOpts = {

    @:native("HashFunc") function hashFunc(): (go.crypto.Hash);

}