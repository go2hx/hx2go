package go.crypto.mlkem;

/**
    Package mlkemtest provides testing functions for the ML-KEM algorithm.
**/
@:go.Type({ name: "mlkemtest", instanceName: "mlkemtest.mlkemtest", imports: ["crypto/mlkem/mlkemtest"] })
extern class Mlkemtest {

    /**
        Encapsulate1024 implements derandomized ML-KEM-1024 encapsulation
        (ML-KEM.Encaps_internal from FIPS 203) using the provided encapsulation key
        ek and 32 bytes of randomness.
        
        It must only be used for known-answer tests.
    **/
    @:go.Tuple("sharedKey", "ciphertext", "err") @:native("Encapsulate1024") static function encapsulate1024(ek: go.Pointer<go.crypto.mlkem.EncapsulationKey1024>, random: go.Slice<go.Byte>): (go.Tuple<{ sharedKey: go.Slice<go.Byte>, ciphertext: go.Slice<go.Byte>, err: go.Error }>);
    /**
        Encapsulate768 implements derandomized ML-KEM-768 encapsulation
        (ML-KEM.Encaps_internal from FIPS 203) using the provided encapsulation key
        ek and 32 bytes of randomness.
        
        It must only be used for known-answer tests.
    **/
    @:go.Tuple("sharedKey", "ciphertext", "err") @:native("Encapsulate768") static function encapsulate768(ek: go.Pointer<go.crypto.mlkem.EncapsulationKey768>, random: go.Slice<go.Byte>): (go.Tuple<{ sharedKey: go.Slice<go.Byte>, ciphertext: go.Slice<go.Byte>, err: go.Error }>);

}