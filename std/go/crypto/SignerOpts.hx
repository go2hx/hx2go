package go.crypto;

@:go.Type({ name: "SignerOpts", instanceName: "crypto.SignerOpts", imports: ["crypto"] })
extern typedef SignerOpts = {

    @:native("HashFunc") function hashFunc(): go.crypto.Hash;

}