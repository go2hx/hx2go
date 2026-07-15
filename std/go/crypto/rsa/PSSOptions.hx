package go.crypto.rsa;

@:structInit
@:go.Type({ name: "PSSOptions", instanceName: "rsa.PSSOptions", imports: ["crypto/rsa"] })
extern class PSSOptions {

    @:native("SaltLength") var saltLength: go.GoInt;
    @:native("Hash") var hash: go.crypto.Hash;

function new(saltLength: go.GoInt, hash: go.crypto.Hash);

    @:native("HashFunc") function hashFunc(): go.crypto.Hash;

}