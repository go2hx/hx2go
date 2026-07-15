package go.crypto.rsa;

@:structInit
@:go.Type({ name: "CRTValue", instanceName: "rsa.CRTValue", imports: ["crypto/rsa"] })
extern class CRTValue {

    @:native("Exp") var exp: go.Pointer<go.math.big.Int>;
    @:native("Coeff") var coeff: go.Pointer<go.math.big.Int>;
    @:native("R") var R: go.Pointer<go.math.big.Int>;

function new(exp: go.Pointer<go.math.big.Int>, coeff: go.Pointer<go.math.big.Int>, R: go.Pointer<go.math.big.Int>);

}