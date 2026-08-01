package go.crypto.cipher;

@:structInit
@:go.Type({ name: "cbcEncrypter", instanceName: "cipher.cbcEncrypter", imports: ["crypto/cipher"] })
extern class CbcEncrypter {

    @:native("BlockSize") function blockSize(): (go.GoInt);
    @:native("CryptBlocks") function cryptBlocks(dst: go.Slice<go.Byte>, src: go.Slice<go.Byte>): Void;
    @:native("SetIV") function setIV(iv: go.Slice<go.Byte>): Void;

}