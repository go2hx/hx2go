package go.crypto;

@:go.Type({ name: "hkdf", instanceName: "hkdf.hkdf", imports: ["crypto/hkdf"] })
extern class Hkdf {

    @:native("Expand") static function expand<H: go.hash.Hash>(h: () -> H, pseudorandomKey: go.Slice<go.Byte>, info: String, keyLength: go.GoInt): go.Result<go.Slice<go.Byte>>;
    @:native("Extract") static function extract<H: go.hash.Hash>(h: () -> H, secret: go.Slice<go.Byte>, salt: go.Slice<go.Byte>): go.Result<go.Slice<go.Byte>>;
    @:native("Key") static function key<Hash: go.hash.Hash>(h: () -> Hash, secret: go.Slice<go.Byte>, salt: go.Slice<go.Byte>, info: String, keyLength: go.GoInt): go.Result<go.Slice<go.Byte>>;

}