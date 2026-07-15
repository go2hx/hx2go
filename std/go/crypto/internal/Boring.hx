package go.crypto.internal;

@:go.Type({ name: "boring", instanceName: "boring.boring", imports: ["crypto/internal/boring"] })
extern class Boring {

    @:native("Enabled") static var Enabled: Bool;
    @:native("RandReader") static var RandReader: go.crypto.internal.boring.randReader;

    @:native("DecryptRSANoPadding") static function decryptRSANoPadding(priv: go.Pointer<go.crypto.internal.boring.PrivateKeyRSA>, ciphertext: go.Slice<go.Byte>): go.Result<go.Slice<go.Byte>>;
    @:native("DecryptRSAOAEP") static function decryptRSAOAEP(h: go.hash.Hash, mgfHash: go.hash.Hash, priv: go.Pointer<go.crypto.internal.boring.PrivateKeyRSA>, ciphertext: go.Slice<go.Byte>, label: go.Slice<go.Byte>): go.Result<go.Slice<go.Byte>>;
    @:native("DecryptRSAPKCS1") static function decryptRSAPKCS1(priv: go.Pointer<go.crypto.internal.boring.PrivateKeyRSA>, ciphertext: go.Slice<go.Byte>): go.Result<go.Slice<go.Byte>>;
    @:native("ECDH") static function ECDH(p0: go.Pointer<go.crypto.internal.boring.PrivateKeyECDH>, p1: go.Pointer<go.crypto.internal.boring.PublicKeyECDH>): go.Result<go.Slice<go.Byte>>;
    @:native("EncryptRSANoPadding") static function encryptRSANoPadding(pub: go.Pointer<go.crypto.internal.boring.PublicKeyRSA>, msg: go.Slice<go.Byte>): go.Result<go.Slice<go.Byte>>;
    @:native("EncryptRSAOAEP") static function encryptRSAOAEP(h: go.hash.Hash, mgfHash: go.hash.Hash, pub: go.Pointer<go.crypto.internal.boring.PublicKeyRSA>, msg: go.Slice<go.Byte>, label: go.Slice<go.Byte>): go.Result<go.Slice<go.Byte>>;
    @:native("EncryptRSAPKCS1") static function encryptRSAPKCS1(pub: go.Pointer<go.crypto.internal.boring.PublicKeyRSA>, msg: go.Slice<go.Byte>): go.Result<go.Slice<go.Byte>>;
    @:go.Tuple("p0", "p1", "p2") @:native("GenerateKeyECDH") static function generateKeyECDH(p0: String): go.Tuple<{ p0: go.Pointer<go.crypto.internal.boring.PrivateKeyECDH>, p1: go.Slice<go.Byte>, p2: go.Error }>;
    @:go.Tuple("X", "Y", "D", "err") @:native("GenerateKeyECDSA") static function generateKeyECDSA(curve: String): go.Tuple<{ X: go.crypto.internal.boring.BigInt, Y: go.crypto.internal.boring.BigInt, D: go.crypto.internal.boring.BigInt, err: go.Error }>;
    @:go.Tuple("N", "E", "D", "P", "Q", "Dp", "Dq", "Qinv", "err") @:native("GenerateKeyRSA") static function generateKeyRSA(bits: go.GoInt): go.Tuple<{ N: go.crypto.internal.boring.BigInt, E: go.crypto.internal.boring.BigInt, D: go.crypto.internal.boring.BigInt, P: go.crypto.internal.boring.BigInt, Q: go.crypto.internal.boring.BigInt, Dp: go.crypto.internal.boring.BigInt, Dq: go.crypto.internal.boring.BigInt, Qinv: go.crypto.internal.boring.BigInt, err: go.Error }>;
    @:native("NewAESCipher") static function newAESCipher(key: go.Slice<go.Byte>): go.Result<go.crypto.cipher.Block>;
    @:native("NewGCMTLS") static function newGCMTLS(p0: go.crypto.cipher.Block): go.Result<go.crypto.cipher.AEAD>;
    @:native("NewGCMTLS13") static function newGCMTLS13(p0: go.crypto.cipher.Block): go.Result<go.crypto.cipher.AEAD>;
    @:native("NewHMAC") static function newHMAC(h: () -> go.hash.Hash, key: go.Slice<go.Byte>): go.hash.Hash;
    @:native("NewPrivateKeyECDH") static function newPrivateKeyECDH(p0: String, p1: go.Slice<go.Byte>): go.Result<go.Pointer<go.crypto.internal.boring.PrivateKeyECDH>>;
    @:native("NewPrivateKeyECDSA") static function newPrivateKeyECDSA(curve: String, X: go.crypto.internal.boring.BigInt, Y: go.crypto.internal.boring.BigInt, D: go.crypto.internal.boring.BigInt): go.Result<go.Pointer<go.crypto.internal.boring.PrivateKeyECDSA>>;
    @:native("NewPrivateKeyRSA") static function newPrivateKeyRSA(N: go.crypto.internal.boring.BigInt, E: go.crypto.internal.boring.BigInt, D: go.crypto.internal.boring.BigInt, P: go.crypto.internal.boring.BigInt, Q: go.crypto.internal.boring.BigInt, Dp: go.crypto.internal.boring.BigInt, Dq: go.crypto.internal.boring.BigInt, Qinv: go.crypto.internal.boring.BigInt): go.Result<go.Pointer<go.crypto.internal.boring.PrivateKeyRSA>>;
    @:native("NewPublicKeyECDH") static function newPublicKeyECDH(p0: String, p1: go.Slice<go.Byte>): go.Result<go.Pointer<go.crypto.internal.boring.PublicKeyECDH>>;
    @:native("NewPublicKeyECDSA") static function newPublicKeyECDSA(curve: String, X: go.crypto.internal.boring.BigInt, Y: go.crypto.internal.boring.BigInt): go.Result<go.Pointer<go.crypto.internal.boring.PublicKeyECDSA>>;
    @:native("NewPublicKeyRSA") static function newPublicKeyRSA(N: go.crypto.internal.boring.BigInt, E: go.crypto.internal.boring.BigInt): go.Result<go.Pointer<go.crypto.internal.boring.PublicKeyRSA>>;
    @:native("NewSHA1") static function newSHA1(): go.hash.Hash;
    @:native("NewSHA224") static function newSHA224(): go.hash.Hash;
    @:native("NewSHA256") static function newSHA256(): go.hash.Hash;
    @:native("NewSHA384") static function newSHA384(): go.hash.Hash;
    @:native("NewSHA512") static function newSHA512(): go.hash.Hash;
    @:native("SHA1") static function SHA1(p0: go.Slice<go.Byte>): go.GoArray<go.Byte, 20>;
    @:native("SHA224") static function SHA224(p0: go.Slice<go.Byte>): go.GoArray<go.Byte, 28>;
    @:native("SHA256") static function SHA256(p0: go.Slice<go.Byte>): go.GoArray<go.Byte, 32>;
    @:native("SHA384") static function SHA384(p0: go.Slice<go.Byte>): go.GoArray<go.Byte, 48>;
    @:native("SHA512") static function SHA512(p0: go.Slice<go.Byte>): go.GoArray<go.Byte, 64>;
    @:native("SignMarshalECDSA") static function signMarshalECDSA(priv: go.Pointer<go.crypto.internal.boring.PrivateKeyECDSA>, hash: go.Slice<go.Byte>): go.Result<go.Slice<go.Byte>>;
    @:native("SignRSAPKCS1v15") static function signRSAPKCS1v15(priv: go.Pointer<go.crypto.internal.boring.PrivateKeyRSA>, h: go.crypto.Hash, hashed: go.Slice<go.Byte>): go.Result<go.Slice<go.Byte>>;
    @:native("SignRSAPSS") static function signRSAPSS(priv: go.Pointer<go.crypto.internal.boring.PrivateKeyRSA>, h: go.crypto.Hash, hashed: go.Slice<go.Byte>, saltLen: go.GoInt): go.Result<go.Slice<go.Byte>>;
    @:native("Unreachable") static function unreachable(): Void;
    @:native("UnreachableExceptTests") static function unreachableExceptTests(): Void;
    @:native("VerifyECDSA") static function verifyECDSA(pub: go.Pointer<go.crypto.internal.boring.PublicKeyECDSA>, hash: go.Slice<go.Byte>, sig: go.Slice<go.Byte>): Bool;
    @:native("VerifyRSAPKCS1v15") static function verifyRSAPKCS1v15(pub: go.Pointer<go.crypto.internal.boring.PublicKeyRSA>, h: go.crypto.Hash, hashed: go.Slice<go.Byte>, sig: go.Slice<go.Byte>): go.Error;
    @:native("VerifyRSAPSS") static function verifyRSAPSS(pub: go.Pointer<go.crypto.internal.boring.PublicKeyRSA>, h: go.crypto.Hash, hashed: go.Slice<go.Byte>, sig: go.Slice<go.Byte>, saltLen: go.GoInt): go.Error;

}