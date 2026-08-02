package go.crypto.des;

@:structInit
@:go.Type({ name: "desCipher", instanceName: "des.desCipher", imports: ["crypto/des"] })
extern class DesCipher {

    @:native("BlockSize") function blockSize(): (go.GoInt);
    @:native("Decrypt") function decrypt(dst: go.Slice<go.Byte>, src: go.Slice<go.Byte>): Void;
    @:native("Encrypt") function encrypt(dst: go.Slice<go.Byte>, src: go.Slice<go.Byte>): Void;

}