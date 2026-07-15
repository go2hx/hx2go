package go.crypto.mlkem;

@:structInit
@:go.Type({ name: "EncapsulationKey1024", instanceName: "mlkem.EncapsulationKey1024", imports: ["crypto/mlkem"] })
extern class EncapsulationKey1024 {

    @:native("Bytes") function bytes(): go.Slice<go.Byte>;
    @:go.Tuple("sharedKey", "ciphertext") @:native("Encapsulate") function encapsulate(): go.Tuple<{ sharedKey: go.Slice<go.Byte>, ciphertext: go.Slice<go.Byte> }>;

}