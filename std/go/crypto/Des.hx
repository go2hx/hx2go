package go.crypto;

@:go.Type({ name: "des", instanceName: "des.des", imports: ["crypto/des"] })
extern class Des {

    @:native("BlockSize") static var BlockSize: go.GoInt;

    @:native("NewCipher") static function newCipher(key: go.Slice<go.Byte>): go.Result<go.crypto.cipher.Block>;
    @:native("NewTripleDESCipher") static function newTripleDESCipher(key: go.Slice<go.Byte>): go.Result<go.crypto.cipher.Block>;

}