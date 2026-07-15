package go.crypto.internal.fips140;

@:go.Type({ name: "sha3", instanceName: "sha3.sha3", imports: ["crypto/internal/fips140/sha3"] })
extern class Sha3 {

    @:native("New224") static function new224(): go.Pointer<go.crypto.internal.fips140.sha3.Digest>;
    @:native("New256") static function new256(): go.Pointer<go.crypto.internal.fips140.sha3.Digest>;
    @:native("New384") static function new384(): go.Pointer<go.crypto.internal.fips140.sha3.Digest>;
    @:native("New512") static function new512(): go.Pointer<go.crypto.internal.fips140.sha3.Digest>;
    @:native("NewCShake128") static function newCShake128(N: go.Slice<go.Byte>, S: go.Slice<go.Byte>): go.Pointer<go.crypto.internal.fips140.sha3.SHAKE>;
    @:native("NewCShake256") static function newCShake256(N: go.Slice<go.Byte>, S: go.Slice<go.Byte>): go.Pointer<go.crypto.internal.fips140.sha3.SHAKE>;
    @:native("NewLegacyKeccak256") static function newLegacyKeccak256(): go.Pointer<go.crypto.internal.fips140.sha3.Digest>;
    @:native("NewLegacyKeccak512") static function newLegacyKeccak512(): go.Pointer<go.crypto.internal.fips140.sha3.Digest>;
    @:native("NewShake128") static function newShake128(): go.Pointer<go.crypto.internal.fips140.sha3.SHAKE>;
    @:native("NewShake256") static function newShake256(): go.Pointer<go.crypto.internal.fips140.sha3.SHAKE>;

}