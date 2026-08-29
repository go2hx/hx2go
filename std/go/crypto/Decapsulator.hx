package go.crypto;

/**
    Decapsulator is an interface for an opaque private KEM key that can be used for
    decapsulation operations. For example, an ML-KEM key kept in a hardware module.
    
    It is implemented, for example, by [crypto/mlkem.DecapsulationKey768].
**/
@:go.Type({ name: "Decapsulator", instanceName: "crypto.Decapsulator", imports: ["crypto"] })
extern typedef Decapsulator = {

    @:native("Decapsulate") function decapsulate(ciphertext: go.Slice<go.Byte>): (go.Result<go.Slice<go.Byte>>);
    @:native("Encapsulator") function encapsulator(): (go.crypto.Encapsulator);

}