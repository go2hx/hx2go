package go.crypto.rsa;

/**
    A PublicKey represents the public part of an RSA key.
    
    The values of N and E are not considered confidential, and may leak through
    side channels, or could be mathematically derived from other public values.
**/
@:structInit
@:go.Type({ name: "PublicKey", instanceName: "rsa.PublicKey", imports: ["crypto/rsa"] })
extern class PublicKey {

    @:native("N") var N: go.Pointer<go.math.big.Int>;
    @:native("E") var E: go.GoInt;

    function new(N: go.Pointer<go.math.big.Int>=null, E: go.GoInt=0);

    /**
        Equal reports whether pub and x have the same value.
    **/
    @:native("Equal") function equal(x: go.crypto.PublicKey): (Bool);
    /**
        Size returns the modulus size in bytes. Raw signatures and ciphertexts
        for or by this public key will have the same size.
    **/
    @:native("Size") function size(): (go.GoInt);

}