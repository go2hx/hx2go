package go.crypto.internal.fips140;

@:go.Type({ name: "hkdf", instanceName: "hkdf.hkdf", imports: ["crypto/internal/fips140/hkdf"] })
extern class Hkdf {

    @:native("Expand") static function expand<H: go.hash.Hash>(h: () -> H, pseudorandomKey: go.Slice<go.Byte>, info: String, keyLen: go.GoInt): go.Slice<go.Byte>;
    @:native("Extract") static function extract<H: go.hash.Hash>(h: () -> H, secret: go.Slice<go.Byte>, salt: go.Slice<go.Byte>): go.Slice<go.Byte>;
    @:native("Key") static function key<H: go.hash.Hash>(h: () -> H, secret: go.Slice<go.Byte>, salt: go.Slice<go.Byte>, info: String, keyLen: go.GoInt): go.Slice<go.Byte>;

}