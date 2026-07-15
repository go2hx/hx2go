package go.crypto;

@:go.Type({ name: "rsa", instanceName: "rsa.rsa", imports: ["crypto/rsa"] })
extern class Rsa {

    @:native("PSSSaltLengthAuto") static var PSSSaltLengthAuto: go.GoInt;
    @:native("PSSSaltLengthEqualsHash") static var PSSSaltLengthEqualsHash: go.GoInt;

    @:native("DecryptOAEP") static function decryptOAEP(hash: go.hash.Hash, random: go.io.Reader, priv: go.Pointer<go.crypto.rsa.PrivateKey>, ciphertext: go.Slice<go.Byte>, label: go.Slice<go.Byte>): go.Result<go.Slice<go.Byte>>;
    @:native("DecryptPKCS1v15") static function decryptPKCS1v15(random: go.io.Reader, priv: go.Pointer<go.crypto.rsa.PrivateKey>, ciphertext: go.Slice<go.Byte>): go.Result<go.Slice<go.Byte>>;
    @:native("DecryptPKCS1v15SessionKey") static function decryptPKCS1v15SessionKey(random: go.io.Reader, priv: go.Pointer<go.crypto.rsa.PrivateKey>, ciphertext: go.Slice<go.Byte>, key: go.Slice<go.Byte>): go.Error;
    @:native("EncryptOAEP") static function encryptOAEP(hash: go.hash.Hash, random: go.io.Reader, pub: go.Pointer<go.crypto.rsa.PublicKey>, msg: go.Slice<go.Byte>, label: go.Slice<go.Byte>): go.Result<go.Slice<go.Byte>>;
    @:native("EncryptOAEPWithOptions") static function encryptOAEPWithOptions(random: go.io.Reader, pub: go.Pointer<go.crypto.rsa.PublicKey>, msg: go.Slice<go.Byte>, opts: go.Pointer<go.crypto.rsa.OAEPOptions>): go.Result<go.Slice<go.Byte>>;
    @:native("EncryptPKCS1v15") static function encryptPKCS1v15(random: go.io.Reader, pub: go.Pointer<go.crypto.rsa.PublicKey>, msg: go.Slice<go.Byte>): go.Result<go.Slice<go.Byte>>;
    @:native("GenerateKey") static function generateKey(random: go.io.Reader, bits: go.GoInt): go.Result<go.Pointer<go.crypto.rsa.PrivateKey>>;
    @:native("GenerateMultiPrimeKey") static function generateMultiPrimeKey(random: go.io.Reader, nprimes: go.GoInt, bits: go.GoInt): go.Result<go.Pointer<go.crypto.rsa.PrivateKey>>;
    @:native("SignPKCS1v15") static function signPKCS1v15(random: go.io.Reader, priv: go.Pointer<go.crypto.rsa.PrivateKey>, hash: go.crypto.Hash, hashed: go.Slice<go.Byte>): go.Result<go.Slice<go.Byte>>;
    @:native("SignPSS") static function signPSS(random: go.io.Reader, priv: go.Pointer<go.crypto.rsa.PrivateKey>, hash: go.crypto.Hash, digest: go.Slice<go.Byte>, opts: go.Pointer<go.crypto.rsa.PSSOptions>): go.Result<go.Slice<go.Byte>>;
    @:native("VerifyPKCS1v15") static function verifyPKCS1v15(pub: go.Pointer<go.crypto.rsa.PublicKey>, hash: go.crypto.Hash, hashed: go.Slice<go.Byte>, sig: go.Slice<go.Byte>): go.Error;
    @:native("VerifyPSS") static function verifyPSS(pub: go.Pointer<go.crypto.rsa.PublicKey>, hash: go.crypto.Hash, digest: go.Slice<go.Byte>, sig: go.Slice<go.Byte>, opts: go.Pointer<go.crypto.rsa.PSSOptions>): go.Error;

}