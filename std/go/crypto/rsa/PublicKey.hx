package go.crypto.rsa;

@:structInit
@:go.Type({ name: "PublicKey", instanceName: "rsa.PublicKey", imports: ["crypto/rsa"] })
extern class PublicKey {

    @:native("N") var N: go.Pointer<go.math.big.Int>;
    @:native("E") var E: go.GoInt;

function new(N: go.Pointer<go.math.big.Int>, E: go.GoInt);

    @:native("Equal") function equal(x: go.crypto.PublicKey): Bool;
    @:native("Size") function size(): go.GoInt;

}