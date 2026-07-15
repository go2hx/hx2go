package go.crypto.internal.fips140.aes;

@:structInit
@:go.Type({ name: "CBCDecrypter", instanceName: "aes.CBCDecrypter", imports: ["crypto/internal/fips140/aes"] })
extern class CBCDecrypter {

    @:native("BlockSize") function blockSize(): go.GoInt;
    @:native("CryptBlocks") function cryptBlocks(dst: go.Slice<go.Byte>, src: go.Slice<go.Byte>): Void;
    @:native("SetIV") function setIV(iv: go.Slice<go.Byte>): Void;

}