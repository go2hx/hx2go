package go.crypto.ed25519;

/**
    PublicKey is the type of Ed25519 public keys.
**/
@:go.Type({ name: "PublicKey", instanceName: "ed25519.PublicKey", imports: ["crypto/ed25519"] })
extern class PublicKey {

    /**
        Equal reports whether pub and x have the same value.
    **/
    @:native("Equal") function equal(x: go.crypto.PublicKey): (Bool);

}