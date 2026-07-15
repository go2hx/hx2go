package go.crypto.internal.fips140.aes.gcm;

@:structInit
@:go.Type({ name: "CounterKDF", instanceName: "gcm.CounterKDF", imports: ["crypto/internal/fips140/aes/gcm"] })
extern class CounterKDF {

    @:native("DeriveKey") function deriveKey(label: go.Byte, context: go.GoArray<go.Byte, 12>): go.GoArray<go.Byte, 32>;

}