package go.crypto.internal.fips140;

@:go.Type({ name: "aes", instanceName: "aes.aes", imports: ["crypto/internal/fips140/aes"] })
extern class Aes {

    @:native("BlockSize") static var BlockSize: go.GoInt;

    @:native("EncryptBlockInternal") static function encryptBlockInternal(c: go.Pointer<go.crypto.internal.fips140.aes.Block>, dst: go.Slice<go.Byte>, src: go.Slice<go.Byte>): Void;
    @:native("EncryptionKeySchedule") static function encryptionKeySchedule(c: go.Pointer<go.crypto.internal.fips140.aes.Block>): go.Slice<go.UInt32>;
    @:native("New") static function _new(key: go.Slice<go.Byte>): go.Result<go.Pointer<go.crypto.internal.fips140.aes.Block>>;
    @:native("NewCBCDecrypter") static function newCBCDecrypter(b: go.Pointer<go.crypto.internal.fips140.aes.Block>, iv: go.GoArray<go.Byte, 16>): go.Pointer<go.crypto.internal.fips140.aes.CBCDecrypter>;
    @:native("NewCBCEncrypter") static function newCBCEncrypter(b: go.Pointer<go.crypto.internal.fips140.aes.Block>, iv: go.GoArray<go.Byte, 16>): go.Pointer<go.crypto.internal.fips140.aes.CBCEncrypter>;
    @:native("NewCTR") static function newCTR(b: go.Pointer<go.crypto.internal.fips140.aes.Block>, iv: go.Slice<go.Byte>): go.Pointer<go.crypto.internal.fips140.aes.CTR>;
    @:native("RoundToBlock") static function roundToBlock(c: go.Pointer<go.crypto.internal.fips140.aes.CTR>): Void;

}