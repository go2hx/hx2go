package go.crypto.internal.fips140;

@:go.Type({ name: "edwards25519", instanceName: "edwards25519.edwards25519", imports: ["crypto/internal/fips140/edwards25519"] })
extern class Edwards25519 {

    @:native("NewGeneratorPoint") static function newGeneratorPoint(): go.Pointer<go.crypto.internal.fips140.edwards25519.Point>;
    @:native("NewIdentityPoint") static function newIdentityPoint(): go.Pointer<go.crypto.internal.fips140.edwards25519.Point>;
    @:native("NewScalar") static function newScalar(): go.Pointer<go.crypto.internal.fips140.edwards25519.Scalar>;

}