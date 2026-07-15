package go.crypto.internal.fips140.mlkem;

@:structInit
@:go.Type({ name: "EncapsulationKey1024", instanceName: "mlkem.EncapsulationKey1024", imports: ["crypto/internal/fips140/mlkem"] })
extern class EncapsulationKey1024 {

    @:native("Bytes") function bytes(): go.Slice<go.Byte>;
    @:go.Tuple("sharedKey", "ciphertext") @:native("Encapsulate") function encapsulate(): go.Tuple<{ sharedKey: go.Slice<go.Byte>, ciphertext: go.Slice<go.Byte> }>;
    @:go.Tuple("sharedKey", "ciphertext") @:native("EncapsulateInternal") function encapsulateInternal(m: go.Pointer<go.GoArray<go.Byte, 32>>): go.Tuple<{ sharedKey: go.Slice<go.Byte>, ciphertext: go.Slice<go.Byte> }>;

}