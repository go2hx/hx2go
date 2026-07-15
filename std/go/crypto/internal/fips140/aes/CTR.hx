package go.crypto.internal.fips140.aes;

@:structInit
@:go.Type({ name: "CTR", instanceName: "aes.CTR", imports: ["crypto/internal/fips140/aes"] })
extern class CTR {

    @:native("XORKeyStream") function xORKeyStream(dst: go.Slice<go.Byte>, src: go.Slice<go.Byte>): Void;
    @:native("XORKeyStreamAt") function xORKeyStreamAt(dst: go.Slice<go.Byte>, src: go.Slice<go.Byte>, offset: go.UInt64): Void;

}