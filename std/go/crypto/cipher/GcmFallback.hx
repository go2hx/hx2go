package go.crypto.cipher;

@:structInit
@:go.Type({ name: "gcmFallback", instanceName: "cipher.gcmFallback", imports: ["crypto/cipher"] })
extern class GcmFallback {

    @:native("NonceSize") function nonceSize(): (go.GoInt);
    @:native("Open") function open(dst: go.Slice<go.Byte>, nonce: go.Slice<go.Byte>, ciphertext: go.Slice<go.Byte>, additionalData: go.Slice<go.Byte>): (go.Result<go.Slice<go.Byte>>);
    @:native("Overhead") function overhead(): (go.GoInt);
    @:native("Seal") function seal(dst: go.Slice<go.Byte>, nonce: go.Slice<go.Byte>, plaintext: go.Slice<go.Byte>, additionalData: go.Slice<go.Byte>): (go.Slice<go.Byte>);

}