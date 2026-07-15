package go.crypto.internal.fips140;

@:go.Type({ name: "nistec", instanceName: "nistec.nistec", imports: ["crypto/internal/fips140/nistec"] })
extern class Nistec {

    @:native("NewP224Point") static function newP224Point(): go.Pointer<go.crypto.internal.fips140.nistec.P224Point>;
    @:native("NewP256Point") static function newP256Point(): go.Pointer<go.crypto.internal.fips140.nistec.P256Point>;
    @:native("NewP384Point") static function newP384Point(): go.Pointer<go.crypto.internal.fips140.nistec.P384Point>;
    @:native("NewP521Point") static function newP521Point(): go.Pointer<go.crypto.internal.fips140.nistec.P521Point>;
    @:native("P256OrdInverse") static function p256OrdInverse(k: go.Slice<go.Byte>): go.Result<go.Slice<go.Byte>>;

}