package go.crypto.cipher;

/**
    A BlockMode represents a block cipher running in a block-based mode (CBC,
    ECB etc).
**/
@:go.Type({ name: "BlockMode", instanceName: "cipher.BlockMode", imports: ["crypto/cipher"] })
extern typedef BlockMode = {

    @:native("BlockSize") function blockSize(): (go.GoInt);
    @:native("CryptBlocks") function cryptBlocks(dst: go.Slice<go.Byte>, src: go.Slice<go.Byte>): Void;

}