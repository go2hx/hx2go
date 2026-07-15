package go.crypto.internal.fips140;

@:go.Type({ name: "sha256", instanceName: "sha256.sha256", imports: ["crypto/internal/fips140/sha256"] })
extern class Sha256 {

    @:native("New") static function _new(): go.Pointer<go.crypto.internal.fips140.sha256.Digest>;
    @:native("New224") static function new224(): go.Pointer<go.crypto.internal.fips140.sha256.Digest>;

}