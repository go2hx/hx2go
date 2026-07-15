package go.crypto.mlkem;

@:structInit
@:go.Type({ name: "DecapsulationKey1024", instanceName: "mlkem.DecapsulationKey1024", imports: ["crypto/mlkem"] })
extern class DecapsulationKey1024 {

    @:native("Bytes") function bytes(): go.Slice<go.Byte>;
    @:native("Decapsulate") function decapsulate(ciphertext: go.Slice<go.Byte>): go.Result<go.Slice<go.Byte>>;
    @:native("EncapsulationKey") function encapsulationKey(): go.Pointer<go.crypto.mlkem.EncapsulationKey1024>;
    @:native("Encapsulator") function encapsulator(): go.crypto.Encapsulator;

}