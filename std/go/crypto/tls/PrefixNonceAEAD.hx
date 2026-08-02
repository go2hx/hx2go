package go.crypto.tls;

@:structInit
@:go.Type({ name: "prefixNonceAEAD", instanceName: "tls.prefixNonceAEAD", imports: ["crypto/tls"] })
extern class PrefixNonceAEAD {

    @:native("NonceSize") function nonceSize(): (go.GoInt);
    @:native("Open") function open(out: go.Slice<go.Byte>, nonce: go.Slice<go.Byte>, ciphertext: go.Slice<go.Byte>, additionalData: go.Slice<go.Byte>): (go.Result<go.Slice<go.Byte>>);
    @:native("Overhead") function overhead(): (go.GoInt);
    @:native("Seal") function seal(out: go.Slice<go.Byte>, nonce: go.Slice<go.Byte>, plaintext: go.Slice<go.Byte>, additionalData: go.Slice<go.Byte>): (go.Slice<go.Byte>);

}