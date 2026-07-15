package go.crypto.internal.fips140.ecdh;

@:structInit
@:go.Type({ name: "Curve", instanceName: "ecdh.Curve", imports: ["crypto/internal/fips140/ecdh"] })
extern class Curve<P: go.crypto.internal.fips140.ecdh.Point<P>> {

    @:native("N") var N: go.Slice<go.Byte>;

function new(N: go.Slice<go.Byte>);

}