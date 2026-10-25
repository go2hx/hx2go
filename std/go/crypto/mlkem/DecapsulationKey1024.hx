package go.crypto.mlkem;

/**
    DecapsulationKey1024 is the secret key used to decapsulate a shared key
    from a ciphertext. It includes various precomputed values.
**/
@:structInit
@:go.Type({ name: "DecapsulationKey1024", instanceName: "mlkem.DecapsulationKey1024", imports: ["crypto/mlkem"] })
extern class DecapsulationKey1024 {

    /**
        Bytes returns the decapsulation key as a 64-byte seed in the "d || z" form.
        
        The decapsulation key must be kept secret.
    **/
    @:native("Bytes") function bytes(): (go.Slice<go.Byte>);
    /**
        Decapsulate generates a shared key from a ciphertext and a decapsulation
        key. If the ciphertext is not the correct length, Decapsulate returns an
        error. A ciphertext that is the correct length but otherwise invalid will
        not return an error; instead, it will produce a shared key that does not
        match the sender's, according to FIPS 203.
        
        The shared key must be kept secret.
    **/
    @:native("Decapsulate") function decapsulate(ciphertext: go.Slice<go.Byte>): (go.Result<go.Slice<go.Byte>>);
    /**
        EncapsulationKey returns the public encapsulation key necessary to produce
        ciphertexts.
    **/
    @:native("EncapsulationKey") function encapsulationKey(): (go.Pointer<go.crypto.mlkem.EncapsulationKey1024>);
    /**
        Encapsulator returns the encapsulation key, like
        [DecapsulationKey1024.EncapsulationKey].
        
        It implements [crypto.Decapsulator].
    **/
    @:native("Encapsulator") function encapsulator(): (go.crypto.Encapsulator);

}