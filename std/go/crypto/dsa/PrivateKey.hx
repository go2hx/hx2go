package go.crypto.dsa;

@:structInit
@:go.Type({ name: "PrivateKey", instanceName: "dsa.PrivateKey", imports: ["crypto/dsa"] })
extern class PrivateKey {

    @:native("PublicKey") var publicKey: go.crypto.dsa.PublicKey;
    @:native("X") var X: go.Pointer<go.math.big.Int>;

function new(publicKey: go.crypto.dsa.PublicKey, X: go.Pointer<go.math.big.Int>);

}