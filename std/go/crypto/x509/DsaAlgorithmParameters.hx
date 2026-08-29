package go.crypto.x509;

@:structInit
@:go.Type({ name: "dsaAlgorithmParameters", instanceName: "x509.dsaAlgorithmParameters", imports: ["crypto/x509"] })
extern class DsaAlgorithmParameters {

    @:native("P") var P: go.Pointer<go.math.big.Int>;
    @:native("Q") var Q: go.Pointer<go.math.big.Int>;
    @:native("G") var G: go.Pointer<go.math.big.Int>;

    function new(P: go.Pointer<go.math.big.Int>=null, Q: go.Pointer<go.math.big.Int>=null, G: go.Pointer<go.math.big.Int>=null);

}