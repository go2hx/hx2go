package go.crypto;

/**
    Package mlkem implements the quantum-resistant key encapsulation method
    ML-KEM (formerly known as Kyber), as specified in [NIST FIPS 203].
    
    Most applications should use the ML-KEM-768 parameter set, as implemented by
    [DecapsulationKey768] and [EncapsulationKey768].
    
    [NIST FIPS 203]: https://doi.org/10.6028/NIST.FIPS.203
**/
@:go.Type({ name: "mlkem", instanceName: "mlkem.mlkem", imports: ["crypto/mlkem"] })
extern class Mlkem {

    @:native("CiphertextSize1024") static var ciphertextSize1024: go.GoInt;
    @:native("CiphertextSize768") static var ciphertextSize768: go.GoInt;
    @:native("EncapsulationKeySize1024") static var encapsulationKeySize1024: go.GoInt;
    @:native("EncapsulationKeySize768") static var encapsulationKeySize768: go.GoInt;
    @:native("SeedSize") static var seedSize: go.GoInt;
    @:native("SharedKeySize") static var sharedKeySize: go.GoInt;

    /**
        GenerateKey1024 generates a new decapsulation key, drawing random bytes from
        a secure source. The decapsulation key must be kept secret.
    **/
    @:native("GenerateKey1024") static function generateKey1024(): (go.Result<go.Pointer<go.crypto.mlkem.DecapsulationKey1024>>);
    /**
        GenerateKey768 generates a new decapsulation key, drawing random bytes from
        a secure source. The decapsulation key must be kept secret.
    **/
    @:native("GenerateKey768") static function generateKey768(): (go.Result<go.Pointer<go.crypto.mlkem.DecapsulationKey768>>);
    /**
        NewDecapsulationKey1024 expands a decapsulation key from a 64-byte seed in the
        "d || z" form. The seed must be uniformly random.
    **/
    @:native("NewDecapsulationKey1024") static function newDecapsulationKey1024(seed: go.Slice<go.Byte>): (go.Result<go.Pointer<go.crypto.mlkem.DecapsulationKey1024>>);
    /**
        NewDecapsulationKey768 expands a decapsulation key from a 64-byte seed in the
        "d || z" form. The seed must be uniformly random.
    **/
    @:native("NewDecapsulationKey768") static function newDecapsulationKey768(seed: go.Slice<go.Byte>): (go.Result<go.Pointer<go.crypto.mlkem.DecapsulationKey768>>);
    /**
        NewEncapsulationKey1024 parses an encapsulation key from its encoded form. If
        the encapsulation key is not valid, NewEncapsulationKey1024 returns an error.
    **/
    @:native("NewEncapsulationKey1024") static function newEncapsulationKey1024(encapsulationKey: go.Slice<go.Byte>): (go.Result<go.Pointer<go.crypto.mlkem.EncapsulationKey1024>>);
    /**
        NewEncapsulationKey768 parses an encapsulation key from its encoded form. If
        the encapsulation key is not valid, NewEncapsulationKey768 returns an error.
    **/
    @:native("NewEncapsulationKey768") static function newEncapsulationKey768(encapsulationKey: go.Slice<go.Byte>): (go.Result<go.Pointer<go.crypto.mlkem.EncapsulationKey768>>);

}