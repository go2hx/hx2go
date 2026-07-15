package go.crypto.internal.fips140.aes;

@:go.Type({ name: "gcm", instanceName: "gcm.gcm", imports: ["crypto/internal/fips140/aes/gcm"] })
extern class Gcm {

    @:native("GHASH") static function GHASH(key: go.Pointer<go.GoArray<go.Byte, 16>>, inputs: haxe.Rest<go.Slice<go.Byte>>): go.Slice<go.Byte>;
    @:native("New") static function _new(cipher: go.Pointer<go.crypto.internal.fips140.aes.Block>, nonceSize: go.GoInt, tagSize: go.GoInt): go.Result<go.Pointer<go.crypto.internal.fips140.aes.gcm.GCM>>;
    @:native("NewCMAC") static function newCMAC(b: go.Pointer<go.crypto.internal.fips140.aes.Block>): go.Pointer<go.crypto.internal.fips140.aes.gcm.CMAC>;
    @:native("NewCounterKDF") static function newCounterKDF(b: go.Pointer<go.crypto.internal.fips140.aes.Block>): go.Pointer<go.crypto.internal.fips140.aes.gcm.CounterKDF>;
    @:native("NewGCMForHPKE") static function newGCMForHPKE(cipher: go.Pointer<go.crypto.internal.fips140.aes.Block>): go.Result<go.Pointer<go.crypto.internal.fips140.aes.gcm.GCMWithXORCounterNonce>>;
    @:native("NewGCMForQUIC") static function newGCMForQUIC(cipher: go.Pointer<go.crypto.internal.fips140.aes.Block>, iv: go.Slice<go.Byte>): go.Result<go.Pointer<go.crypto.internal.fips140.aes.gcm.GCMWithXORCounterNonce>>;
    @:native("NewGCMForSSH") static function newGCMForSSH(cipher: go.Pointer<go.crypto.internal.fips140.aes.Block>): go.Result<go.Pointer<go.crypto.internal.fips140.aes.gcm.GCMWithCounterNonce>>;
    @:native("NewGCMForTLS12") static function newGCMForTLS12(cipher: go.Pointer<go.crypto.internal.fips140.aes.Block>): go.Result<go.Pointer<go.crypto.internal.fips140.aes.gcm.GCMWithCounterNonce>>;
    @:native("NewGCMForTLS13") static function newGCMForTLS13(cipher: go.Pointer<go.crypto.internal.fips140.aes.Block>): go.Result<go.Pointer<go.crypto.internal.fips140.aes.gcm.GCMWithXORCounterNonce>>;
    @:native("NewGCMWithCounterNonce") static function newGCMWithCounterNonce(cipher: go.Pointer<go.crypto.internal.fips140.aes.Block>): go.Result<go.Pointer<go.crypto.internal.fips140.aes.gcm.GCMWithCounterNonce>>;
    @:native("NewGCMWithXORCounterNonce") static function newGCMWithXORCounterNonce(cipher: go.Pointer<go.crypto.internal.fips140.aes.Block>): go.Result<go.Pointer<go.crypto.internal.fips140.aes.gcm.GCMWithXORCounterNonce>>;
    @:native("SealWithRandomNonce") static function sealWithRandomNonce(g: go.Pointer<go.crypto.internal.fips140.aes.gcm.GCM>, nonce: go.Slice<go.Byte>, out: go.Slice<go.Byte>, plaintext: go.Slice<go.Byte>, additionalData: go.Slice<go.Byte>): Void;

}