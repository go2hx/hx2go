package go.crypto.mldsa;

/**
    Parameters represents one of the fixed parameter sets defined in FIPS 204.
    
    Most applications should use [MLDSA44].
    
    Multiple invocations of [MLDSA44], [MLDSA65], or [MLDSA87] will return the
    same respective value, which can be used for equality checks and switch
    statements. The returned value is safe for concurrent use.
**/
@:structInit
@:go.Type({ name: "Parameters", instanceName: "mldsa.Parameters", imports: ["crypto/mldsa"] })
extern class Parameters {

    /**
        PublicKeySize returns the size of public keys for this parameter set, in bytes.
    **/
    @:native("PublicKeySize") function publicKeySize(): (go.GoInt);
    /**
        SignatureSize returns the size of signatures for this parameter set, in bytes.
    **/
    @:native("SignatureSize") function signatureSize(): (go.GoInt);
    /**
        String returns the name of the parameter set, e.g. "ML-DSA-44".
    **/
    @:native("String") function string(): (String);

}