package go.crypto.mlkem;

@:structInit
@:go.Type({ name: "EncapsulationKey768", instanceName: "mlkem.EncapsulationKey768", imports: ["crypto/mlkem"] })
extern class EncapsulationKey768 {

    @:native("Bytes") function bytes(): go.Slice<go.Byte>;
    @:go.Tuple("sharedKey", "ciphertext") @:native("Encapsulate") function encapsulate(): go.Tuple<{ sharedKey: go.Slice<go.Byte>, ciphertext: go.Slice<go.Byte> }>;

}