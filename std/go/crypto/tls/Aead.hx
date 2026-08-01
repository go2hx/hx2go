package go.crypto.tls;

@:go.Type({ name: "aead", instanceName: "tls.aead", imports: ["crypto/tls"] })
extern typedef Aead = {

    @:native("NonceSize") function nonceSize(): (go.GoInt);
    @:native("Open") function open(dst: go.Slice<go.Byte>, nonce: go.Slice<go.Byte>, ciphertext: go.Slice<go.Byte>, additionalData: go.Slice<go.Byte>): (go.Result<go.Slice<go.Byte>>);
    @:native("Overhead") function overhead(): (go.GoInt);
    @:native("Seal") function seal(dst: go.Slice<go.Byte>, nonce: go.Slice<go.Byte>, plaintext: go.Slice<go.Byte>, additionalData: go.Slice<go.Byte>): (go.Slice<go.Byte>);

}