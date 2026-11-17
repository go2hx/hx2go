package go.crypto.mldsa;

/**
    PublicKey is an ML-DSA public key. It implements the informal extended
    [crypto.PublicKey] interface.
    
    A PublicKey is safe for concurrent use.
**/
@:structInit
@:go.Type({ name: "PublicKey", instanceName: "mldsa.PublicKey", imports: ["crypto/mldsa"] })
extern class PublicKey {

    /**
        Bytes returns the public key encoding.
    **/
    @:native("Bytes") function bytes(): (go.Slice<go.Byte>);
    /**
        Equal reports whether pk and x are the same key (i.e. they have the same
        encoding).
        
        If x is not a *PublicKey, Equal returns false.
    **/
    @:native("Equal") function equal(x: go.crypto.PublicKey): (Bool);
    /**
        Parameters returns the parameters associated with this public key.
    **/
    @:native("Parameters") function parameters(): (go.crypto.mldsa.Parameters);

}