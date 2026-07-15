package go.crypto;

@:go.Type({ name: "aes", instanceName: "aes.aes", imports: ["crypto/aes"] })
extern class Aes {

    @:native("BlockSize") static var BlockSize: go.GoInt;

    @:native("NewCipher") static function newCipher(key: go.Slice<go.Byte>): go.Result<go.crypto.cipher.Block>;

}