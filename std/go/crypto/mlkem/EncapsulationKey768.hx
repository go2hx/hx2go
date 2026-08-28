package go.crypto.mlkem;

/**
    An EncapsulationKey768 is the public key used to produce ciphertexts to be
    decapsulated by the corresponding DecapsulationKey768.
**/
@:structInit
@:go.Type({ name: "EncapsulationKey768", instanceName: "mlkem.EncapsulationKey768", imports: ["crypto/mlkem"] })
extern class EncapsulationKey768 {

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