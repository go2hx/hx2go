package go.testing;

/**
    Package cryptotest provides deterministic random source testing.
**/
@:go.Type({ name: "cryptotest", instanceName: "cryptotest.cryptotest", imports: ["testing/cryptotest"] })
extern class Cryptotest {

    /**
        SetGlobalRandom sets a global, deterministic cryptographic randomness source
        for the duration of test t. It affects crypto/rand, and all implicit sources
        of cryptographic randomness in the crypto/... packages.
        
        SetGlobalRandom may be called multiple times in the same test to reset the
        random stream or change the seed.
        
        Because SetGlobalRandom affects the whole process, it cannot be used in
        parallel tests or tests with parallel ancestors.
        
        Note that the way cryptographic algorithms use randomness is generally not
        specified and may change over time. Thus, if a test expects a specific output
        from a cryptographic function, it may fail in the future even if it uses
        SetGlobalRandom.
        
        SetGlobalRandom is not supported when building against the Go Cryptographic
        Module v1.0.0 (i.e. when [crypto/fips140.Version] returns "v1.0.0").
    **/
    @:native("SetGlobalRandom") static function setGlobalRandom(t: go.Pointer<go.testing.T>, seed: go.UInt64): Void;

}