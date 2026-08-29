package go.crypto;

/**
    Encapsulator is an interface for a public KEM key that can be used for
    encapsulation operations.
    
    It is implemented, for example, by [crypto/mlkem.EncapsulationKey768].
**/
@:go.Type({ name: "Encapsulator", instanceName: "crypto.Encapsulator", imports: ["crypto"] })
extern typedef Encapsulator = {

    @:native("Bytes") function bytes(): (go.Slice<go.Byte>);
    @:go.Tuple("sharedKey", "ciphertext") @:native("Encapsulate") function encapsulate(): (go.Tuple<{ sharedKey: go.Slice<go.Byte>, ciphertext: go.Slice<go.Byte> }>);

}