package go.crypto.dsa;

/**
    Parameters represents the domain parameters for a key. These parameters can
    be shared across many keys. The bit length of Q must be a multiple of 8.
**/
@:structInit
@:go.Type({ name: "Parameters", instanceName: "dsa.Parameters", imports: ["crypto/dsa"] })
extern class Parameters {

    @:native("P") var P: go.Pointer<go.math.big.Int>;
    @:native("Q") var Q: go.Pointer<go.math.big.Int>;
    @:native("G") var G: go.Pointer<go.math.big.Int>;

    function new(P: go.Pointer<go.math.big.Int>=null, Q: go.Pointer<go.math.big.Int>=null, G: go.Pointer<go.math.big.Int>=null);

}