package go.crypto.internal.fips140.aes.gcm;

@:structInit
@:go.Type({ name: "CMAC", instanceName: "gcm.CMAC", imports: ["crypto/internal/fips140/aes/gcm"] })
extern class CMAC {

    @:native("MAC") function MAC(m: go.Slice<go.Byte>): go.GoArray<go.Byte, 16>;

}