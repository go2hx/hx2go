package go.crypto;

@:go.Type({ name: "rc4", instanceName: "rc4.rc4", imports: ["crypto/rc4"] })
extern class Rc4 {

    @:native("NewCipher") static function newCipher(key: go.Slice<go.Byte>): go.Result<go.Pointer<go.crypto.rc4.Cipher>>;

}