package go.crypto.internal.fips140.rsa;

@:structInit
@:go.Type({ name: "PublicKey", instanceName: "rsa.PublicKey", imports: ["crypto/internal/fips140/rsa"] })
extern class PublicKey {

    @:native("N") var N: go.Pointer<go.crypto.internal.fips140.bigmod.Modulus>;
    @:native("E") var E: go.GoInt;

function new(N: go.Pointer<go.crypto.internal.fips140.bigmod.Modulus>, E: go.GoInt);

    @:native("Size") function size(): go.GoInt;

}