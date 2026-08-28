package go.crypto.mlkem;

/**
    DecapsulationKey768 is the secret key used to decapsulate a shared key
    from a ciphertext. It includes various precomputed values.
**/
@:structInit
@:go.Type({ name: "DecapsulationKey768", instanceName: "mlkem.DecapsulationKey768", imports: ["crypto/mlkem"] })
extern class DecapsulationKey768 {

    /**
        Bytes returns the decapsulation key as a 64-byte seed in the "d || z" form.
        
        The decapsulation key must be kept secret.
    **/
    @:native("Bytes") function bytes(): (go.Slice<go.Byte>);
    /**
        Decapsulate generates a shared key from a ciphertext and a decapsulation
        key. If the ciphertext is not valid, Decapsulate returns an error.
        
        The shared key must be kept secret.
    **/
    @:native("Decapsulate") function decapsulate(ciphertext: go.Slice<go.Byte>): (go.Result<go.Slice<go.Byte>>);
    /**
        EncapsulationKey returns the public encapsulation key necessary to produce
        ciphertexts.
    **/
    @:native("EncapsulationKey") function encapsulationKey(): (go.Pointer<go.crypto.mlkem.EncapsulationKey768>);
    /**
        Encapsulator returns the encapsulation key, like
        [DecapsulationKey768.EncapsulationKey].
        
        It implements [crypto.Decapsulator].
    **/
    @:native("Encapsulator") function encapsulator(): (go.crypto.Encapsulator);

}