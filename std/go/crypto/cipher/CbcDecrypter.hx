package go.crypto.cipher;

@:structInit
@:go.Type({ name: "cbcDecrypter", instanceName: "cipher.cbcDecrypter", imports: ["crypto/cipher"] })
extern class CbcDecrypter {

    @:native("BlockSize") function blockSize(): (go.GoInt);
    @:native("CryptBlocks") function cryptBlocks(dst: go.Slice<go.Byte>, src: go.Slice<go.Byte>): Void;
    @:native("SetIV") function setIV(iv: go.Slice<go.Byte>): Void;

}