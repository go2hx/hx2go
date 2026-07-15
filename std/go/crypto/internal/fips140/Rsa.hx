package go.crypto.internal.fips140;

@:go.Type({ name: "rsa", instanceName: "rsa.rsa", imports: ["crypto/internal/fips140/rsa"] })
extern class Rsa {

    @:native("DecryptOAEP") static function decryptOAEP(hash: go.hash.Hash, mgfHash: go.hash.Hash, priv: go.Pointer<go.crypto.internal.fips140.rsa.PrivateKey>, ciphertext: go.Slice<go.Byte>, label: go.Slice<go.Byte>): go.Result<go.Slice<go.Byte>>;
    @:native("DecryptWithCheck") static function decryptWithCheck(priv: go.Pointer<go.crypto.internal.fips140.rsa.PrivateKey>, ciphertext: go.Slice<go.Byte>): go.Result<go.Slice<go.Byte>>;
    @:native("DecryptWithoutCheck") static function decryptWithoutCheck(priv: go.Pointer<go.crypto.internal.fips140.rsa.PrivateKey>, ciphertext: go.Slice<go.Byte>): go.Result<go.Slice<go.Byte>>;
    @:native("Encrypt") static function encrypt(pub: go.Pointer<go.crypto.internal.fips140.rsa.PublicKey>, plaintext: go.Slice<go.Byte>): go.Result<go.Slice<go.Byte>>;
    @:native("EncryptOAEP") static function encryptOAEP(hash: go.hash.Hash, mgfHash: go.hash.Hash, random: go.io.Reader, pub: go.Pointer<go.crypto.internal.fips140.rsa.PublicKey>, msg: go.Slice<go.Byte>, label: go.Slice<go.Byte>): go.Result<go.Slice<go.Byte>>;
    @:native("GenerateKey") static function generateKey(rand: go.io.Reader, bits: go.GoInt): go.Result<go.Pointer<go.crypto.internal.fips140.rsa.PrivateKey>>;
    @:native("NewPrivateKey") static function newPrivateKey(N: go.Slice<go.Byte>, e: go.GoInt, d: go.Slice<go.Byte>, P: go.Slice<go.Byte>, Q: go.Slice<go.Byte>): go.Result<go.Pointer<go.crypto.internal.fips140.rsa.PrivateKey>>;
    @:native("NewPrivateKeyWithPrecomputation") static function newPrivateKeyWithPrecomputation(N: go.Slice<go.Byte>, e: go.GoInt, d: go.Slice<go.Byte>, P: go.Slice<go.Byte>, Q: go.Slice<go.Byte>, dP: go.Slice<go.Byte>, dQ: go.Slice<go.Byte>, qInv: go.Slice<go.Byte>): go.Result<go.Pointer<go.crypto.internal.fips140.rsa.PrivateKey>>;
    @:native("NewPrivateKeyWithoutCRT") static function newPrivateKeyWithoutCRT(N: go.Slice<go.Byte>, e: go.GoInt, d: go.Slice<go.Byte>): go.Result<go.Pointer<go.crypto.internal.fips140.rsa.PrivateKey>>;
    @:native("PSSMaxSaltLength") static function pSSMaxSaltLength(pub: go.Pointer<go.crypto.internal.fips140.rsa.PublicKey>, hash: go.hash.Hash): go.Result<go.GoInt>;
    @:native("SignPKCS1v15") static function signPKCS1v15(priv: go.Pointer<go.crypto.internal.fips140.rsa.PrivateKey>, hash: String, hashed: go.Slice<go.Byte>): go.Result<go.Slice<go.Byte>>;
    @:native("SignPSS") static function signPSS(rand: go.io.Reader, priv: go.Pointer<go.crypto.internal.fips140.rsa.PrivateKey>, hash: go.hash.Hash, hashed: go.Slice<go.Byte>, saltLength: go.GoInt): go.Result<go.Slice<go.Byte>>;
    @:native("VerifyPKCS1v15") static function verifyPKCS1v15(pub: go.Pointer<go.crypto.internal.fips140.rsa.PublicKey>, hash: String, hashed: go.Slice<go.Byte>, sig: go.Slice<go.Byte>): go.Error;
    @:native("VerifyPSS") static function verifyPSS(pub: go.Pointer<go.crypto.internal.fips140.rsa.PublicKey>, hash: go.hash.Hash, digest: go.Slice<go.Byte>, sig: go.Slice<go.Byte>): go.Error;
    @:native("VerifyPSSWithSaltLength") static function verifyPSSWithSaltLength(pub: go.Pointer<go.crypto.internal.fips140.rsa.PublicKey>, hash: go.hash.Hash, digest: go.Slice<go.Byte>, sig: go.Slice<go.Byte>, saltLength: go.GoInt): go.Error;

}