package go.crypto;

/**
    Package rc4 implements RC4 encryption, as defined in Bruce Schneier's
    Applied Cryptography.
    
    RC4 is cryptographically broken and should not be used for secure
    applications.
**/
@:go.Type({ name: "rc4", instanceName: "rc4.rc4", imports: ["crypto/rc4"] })
extern class Rc4 {

    /**
        NewCipher creates and returns a new [Cipher]. The key argument should be the
        RC4 key, at least 1 byte and at most 256 bytes.
    **/
    @:native("NewCipher") static function newCipher(key: go.Slice<go.Byte>): (go.Result<go.Pointer<go.crypto.rc4.Cipher>>);

}