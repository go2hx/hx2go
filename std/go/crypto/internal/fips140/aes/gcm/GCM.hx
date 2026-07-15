package go.crypto.internal.fips140.aes.gcm;

@:structInit
@:go.Type({ name: "GCM", instanceName: "gcm.GCM", imports: ["crypto/internal/fips140/aes/gcm"] })
extern class GCM {

    @:native("NonceSize") function nonceSize(): go.GoInt;
    @:native("Open") function open(dst: go.Slice<go.Byte>, nonce: go.Slice<go.Byte>, ciphertext: go.Slice<go.Byte>, data: go.Slice<go.Byte>): go.Result<go.Slice<go.Byte>>;
    @:native("Overhead") function overhead(): go.GoInt;
    @:native("Seal") function seal(dst: go.Slice<go.Byte>, nonce: go.Slice<go.Byte>, plaintext: go.Slice<go.Byte>, data: go.Slice<go.Byte>): go.Slice<go.Byte>;

}