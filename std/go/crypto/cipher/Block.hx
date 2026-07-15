package go.crypto.cipher;

@:go.Type({ name: "Block", instanceName: "cipher.Block", imports: ["crypto/cipher"] })
extern typedef Block = {

    @:native("BlockSize") function blockSize(): go.GoInt;
    @:native("Decrypt") function decrypt(dst: go.Slice<go.Byte>, src: go.Slice<go.Byte>): Void;
    @:native("Encrypt") function encrypt(dst: go.Slice<go.Byte>, src: go.Slice<go.Byte>): Void;

}