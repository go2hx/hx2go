package go.crypto.internal.fips140.aes;

@:structInit
@:go.Type({ name: "CBCEncrypter", instanceName: "aes.CBCEncrypter", imports: ["crypto/internal/fips140/aes"] })
extern class CBCEncrypter {

    @:native("BlockSize") function blockSize(): go.GoInt;
    @:native("CryptBlocks") function cryptBlocks(dst: go.Slice<go.Byte>, src: go.Slice<go.Byte>): Void;
    @:native("SetIV") function setIV(iv: go.Slice<go.Byte>): Void;

}