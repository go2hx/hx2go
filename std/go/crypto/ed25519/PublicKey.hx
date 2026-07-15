package go.crypto.ed25519;

@:go.Type({ name: "PublicKey", instanceName: "ed25519.PublicKey", imports: ["crypto/ed25519"] })
extern class PublicKey {

    @:native("Equal") function equal(x: go.crypto.PublicKey): Bool;

}