package go.crypto.cipher;

@:go.Type({ name: "BlockMode", instanceName: "cipher.BlockMode", imports: ["crypto/cipher"] })
extern typedef BlockMode = {

    @:native("BlockSize") function blockSize(): go.GoInt;
    @:native("CryptBlocks") function cryptBlocks(dst: go.Slice<go.Byte>, src: go.Slice<go.Byte>): Void;

}