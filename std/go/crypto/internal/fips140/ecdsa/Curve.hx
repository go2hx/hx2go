package go.crypto.internal.fips140.ecdsa;

@:structInit
@:go.Type({ name: "Curve", instanceName: "ecdsa.Curve", imports: ["crypto/internal/fips140/ecdsa"] })
extern class Curve<P: go.crypto.internal.fips140.ecdsa.Point<P>> {

    @:native("N") var N: go.Pointer<go.crypto.internal.fips140.bigmod.Modulus>;

function new(N: go.Pointer<go.crypto.internal.fips140.bigmod.Modulus>);

}