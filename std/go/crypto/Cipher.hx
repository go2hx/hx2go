package go.crypto;

@:go.Type({ name: "cipher", instanceName: "cipher.cipher", imports: ["crypto/cipher"] })
extern class Cipher {

    @:native("NewCBCDecrypter") static function newCBCDecrypter(b: go.crypto.cipher.Block, iv: go.Slice<go.Byte>): go.crypto.cipher.BlockMode;
    @:native("NewCBCEncrypter") static function newCBCEncrypter(b: go.crypto.cipher.Block, iv: go.Slice<go.Byte>): go.crypto.cipher.BlockMode;
    @:native("NewCFBDecrypter") static function newCFBDecrypter(block: go.crypto.cipher.Block, iv: go.Slice<go.Byte>): go.crypto.cipher.Stream;
    @:native("NewCFBEncrypter") static function newCFBEncrypter(block: go.crypto.cipher.Block, iv: go.Slice<go.Byte>): go.crypto.cipher.Stream;
    @:native("NewCTR") static function newCTR(block: go.crypto.cipher.Block, iv: go.Slice<go.Byte>): go.crypto.cipher.Stream;
    @:native("NewGCM") static function newGCM(cipher: go.crypto.cipher.Block): go.Result<go.crypto.cipher.AEAD>;
    @:native("NewGCMWithNonceSize") static function newGCMWithNonceSize(cipher: go.crypto.cipher.Block, size: go.GoInt): go.Result<go.crypto.cipher.AEAD>;
    @:native("NewGCMWithRandomNonce") static function newGCMWithRandomNonce(cipher: go.crypto.cipher.Block): go.Result<go.crypto.cipher.AEAD>;
    @:native("NewGCMWithTagSize") static function newGCMWithTagSize(cipher: go.crypto.cipher.Block, tagSize: go.GoInt): go.Result<go.crypto.cipher.AEAD>;
    @:native("NewOFB") static function newOFB(b: go.crypto.cipher.Block, iv: go.Slice<go.Byte>): go.crypto.cipher.Stream;

}