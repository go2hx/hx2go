package go.crypto.x509;

@:structInit
@:go.Type({ name: "pkcs1PublicKey", instanceName: "x509.pkcs1PublicKey", imports: ["crypto/x509"] })
extern class Pkcs1PublicKey {

    @:native("N") var N: go.Pointer<go.math.big.Int>;
    @:native("E") var E: go.GoInt;

    function new(N: go.Pointer<go.math.big.Int>, E: go.GoInt);

}