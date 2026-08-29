package go.crypto.dsa;

/**
    PublicKey represents a DSA public key.
**/
@:structInit
@:go.Type({ name: "PublicKey", instanceName: "dsa.PublicKey", imports: ["crypto/dsa"] })
extern class PublicKey {

    @:native("Parameters") var parameters: go.crypto.dsa.Parameters;
    @:native("Y") var Y: go.Pointer<go.math.big.Int>;
    @:native("P") var P: go.Pointer<go.math.big.Int>;
    @:native("Q") var Q: go.Pointer<go.math.big.Int>;
    @:native("G") var G: go.Pointer<go.math.big.Int>;

    function new(parameters: go.crypto.dsa.Parameters, Y: go.Pointer<go.math.big.Int>=null);

}