package go.crypto.mlkem;

@:structInit
@:go.Type({ name: "DecapsulationKey768", instanceName: "mlkem.DecapsulationKey768", imports: ["crypto/mlkem"] })
extern class DecapsulationKey768 {

    @:native("Bytes") function bytes(): go.Slice<go.Byte>;
    @:native("Decapsulate") function decapsulate(ciphertext: go.Slice<go.Byte>): go.Result<go.Slice<go.Byte>>;
    @:native("EncapsulationKey") function encapsulationKey(): go.Pointer<go.crypto.mlkem.EncapsulationKey768>;
    @:native("Encapsulator") function encapsulator(): go.crypto.Encapsulator;

}