package go.crypto.mlkem;

/**
    An EncapsulationKey1024 is the public key used to produce ciphertexts to be
    decapsulated by the corresponding DecapsulationKey1024.
**/
@:structInit
@:go.Type({ name: "EncapsulationKey1024", instanceName: "mlkem.EncapsulationKey1024", imports: ["crypto/mlkem"] })
extern class EncapsulationKey1024 {

    /**
        Bytes returns the encapsulation key as a byte slice.
    **/
    @:native("Bytes") function bytes(): (go.Slice<go.Byte>);
    /**
        Encapsulate generates a shared key and an associated ciphertext from an
        encapsulation key, drawing random bytes from a secure source.
        
        The shared key must be kept secret.
        
        For testing, derandomized encapsulation is provided by the
        [crypto/mlkem/mlkemtest] package.
    **/
    @:go.Tuple("sharedKey", "ciphertext") @:native("Encapsulate") function encapsulate(): (go.Tuple<{ sharedKey: go.Slice<go.Byte>, ciphertext: go.Slice<go.Byte> }>);

}