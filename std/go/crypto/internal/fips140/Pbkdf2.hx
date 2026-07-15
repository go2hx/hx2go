package go.crypto.internal.fips140;

@:go.Type({ name: "pbkdf2", instanceName: "pbkdf2.pbkdf2", imports: ["crypto/internal/fips140/pbkdf2"] })
extern class Pbkdf2 {

    @:native("Key") static function key<Hash: go.hash.Hash>(h: () -> Hash, password: String, salt: go.Slice<go.Byte>, iter: go.GoInt, keyLength: go.GoInt): go.Result<go.Slice<go.Byte>>;

}