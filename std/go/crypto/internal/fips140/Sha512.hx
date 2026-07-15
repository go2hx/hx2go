package go.crypto.internal.fips140;

@:go.Type({ name: "sha512", instanceName: "sha512.sha512", imports: ["crypto/internal/fips140/sha512"] })
extern class Sha512 {

    @:native("New") static function _new(): go.Pointer<go.crypto.internal.fips140.sha512.Digest>;
    @:native("New384") static function new384(): go.Pointer<go.crypto.internal.fips140.sha512.Digest>;
    @:native("New512_224") static function new512_224(): go.Pointer<go.crypto.internal.fips140.sha512.Digest>;
    @:native("New512_256") static function new512_256(): go.Pointer<go.crypto.internal.fips140.sha512.Digest>;

}