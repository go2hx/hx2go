package go.crypto.x509;

@:structInit
@:go.Type({ name: "pkcs1AdditionalRSAPrime", instanceName: "x509.pkcs1AdditionalRSAPrime", imports: ["crypto/x509"] })
extern class Pkcs1AdditionalRSAPrime {

    @:native("Prime") var prime: go.Pointer<go.math.big.Int>;
    @:native("Exp") var exp: go.Pointer<go.math.big.Int>;
    @:native("Coeff") var coeff: go.Pointer<go.math.big.Int>;

    function new(prime: go.Pointer<go.math.big.Int>, exp: go.Pointer<go.math.big.Int>, coeff: go.Pointer<go.math.big.Int>);

}