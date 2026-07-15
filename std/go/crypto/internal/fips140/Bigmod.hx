package go.crypto.internal.fips140;

@:go.Type({ name: "bigmod", instanceName: "bigmod.bigmod", imports: ["crypto/internal/fips140/bigmod"] })
extern class Bigmod {

    @:native("NewModulus") static function newModulus(b: go.Slice<go.Byte>): go.Result<go.Pointer<go.crypto.internal.fips140.bigmod.Modulus>>;
    @:native("NewModulusProduct") static function newModulusProduct(a: go.Slice<go.Byte>, b: go.Slice<go.Byte>): go.Result<go.Pointer<go.crypto.internal.fips140.bigmod.Modulus>>;
    @:native("NewNat") static function newNat(): go.Pointer<go.crypto.internal.fips140.bigmod.Nat>;

}