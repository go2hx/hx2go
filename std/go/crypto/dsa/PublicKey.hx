package go.crypto.dsa;

@:structInit
@:go.Type({ name: "PublicKey", instanceName: "dsa.PublicKey", imports: ["crypto/dsa"] })
extern class PublicKey {

    @:native("Parameters") var parameters: go.crypto.dsa.Parameters;
    @:native("Y") var Y: go.Pointer<go.math.big.Int>;

function new(parameters: go.crypto.dsa.Parameters, Y: go.Pointer<go.math.big.Int>);

}