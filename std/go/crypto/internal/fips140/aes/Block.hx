package go.crypto.internal.fips140.aes;

@:structInit
@:go.Type({ name: "Block", instanceName: "aes.Block", imports: ["crypto/internal/fips140/aes"] })
extern class Block {

    @:native("BlockSize") function blockSize(): go.GoInt;
    @:native("Decrypt") function decrypt(dst: go.Slice<go.Byte>, src: go.Slice<go.Byte>): Void;
    @:native("Encrypt") function encrypt(dst: go.Slice<go.Byte>, src: go.Slice<go.Byte>): Void;

}