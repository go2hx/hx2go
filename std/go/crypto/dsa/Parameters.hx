package go.crypto.dsa;

@:structInit
@:go.Type({ name: "Parameters", instanceName: "dsa.Parameters", imports: ["crypto/dsa"] })
extern class Parameters {

    @:native("P") var P: go.Pointer<go.math.big.Int>;
    @:native("Q") var Q: go.Pointer<go.math.big.Int>;
    @:native("G") var G: go.Pointer<go.math.big.Int>;

    function new(P: go.Pointer<go.math.big.Int>=null, Q: go.Pointer<go.math.big.Int>=null, G: go.Pointer<go.math.big.Int>=null);

}