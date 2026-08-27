package go.crypto.dsa;

@:structInit
@:go.Type({ name: "PrivateKey", instanceName: "dsa.PrivateKey", imports: ["crypto/dsa"] })
extern class PrivateKey {

    @:native("PublicKey") var publicKey: go.crypto.dsa.PublicKey;
    @:native("X") var X: go.Pointer<go.math.big.Int>;
    @:native("Parameters") var parameters: go.crypto.dsa.Parameters;
    @:native("Y") var Y: go.Pointer<go.math.big.Int>;
    @:native("P") var P: go.Pointer<go.math.big.Int>;
    @:native("Q") var Q: go.Pointer<go.math.big.Int>;
    @:native("G") var G: go.Pointer<go.math.big.Int>;

    function new(publicKey: go.crypto.dsa.PublicKey, X: go.Pointer<go.math.big.Int>=null);

}