package go.crypto.ed25519;

@:structInit
@:go.Type({ name: "Options", instanceName: "ed25519.Options", imports: ["crypto/ed25519"] })
extern class Options {

    @:native("Hash") var hash: go.crypto.Hash;
    @:native("Context") var context: String;

function new(hash: go.crypto.Hash, context: String);

    @:native("HashFunc") function hashFunc(): go.crypto.Hash;

}