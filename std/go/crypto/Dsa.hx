package go.crypto;

/**
    Package dsa implements the Digital Signature Algorithm, as defined in FIPS 186-3.
    
    The DSA operations in this package are not implemented using constant-time algorithms.
    
    Deprecated: DSA is a legacy algorithm, and modern alternatives such as
    Ed25519 (implemented by package crypto/ed25519) should be used instead. Keys
    with 1024-bit moduli (L1024N160 parameters) are cryptographically weak, while
    bigger keys are not widely supported. Note that FIPS 186-5 no longer approves
    DSA for signature generation.
**/
@:go.Type({ name: "dsa", instanceName: "dsa.dsa", imports: ["crypto/dsa"] })
extern class Dsa {

    @:native("L1024N160") static var L1024N160: go.crypto.dsa.ParameterSizes;
    @:native("L2048N224") static var L2048N224: go.crypto.dsa.ParameterSizes;
    @:native("L2048N256") static var L2048N256: go.crypto.dsa.ParameterSizes;
    @:native("L3072N256") static var L3072N256: go.crypto.dsa.ParameterSizes;

    /**
        GenerateKey generates a public&private key pair. The Parameters of the
        [PrivateKey] must already be valid (see [GenerateParameters]).
    **/
    @:native("GenerateKey") static function generateKey(priv: go.Pointer<go.crypto.dsa.PrivateKey>, rand: go.io.Reader): (go.Error);
    /**
        GenerateParameters puts a random, valid set of DSA parameters into params.
        This function can take many seconds, even on fast machines.
    **/
    @:native("GenerateParameters") static function generateParameters(params: go.Pointer<go.crypto.dsa.Parameters>, rand: go.io.Reader, sizes: go.crypto.dsa.ParameterSizes): (go.Error);
    /**
        Sign signs an arbitrary length hash (which should be the result of hashing a
        larger message) using the private key, priv. It returns the signature as a
        pair of integers. The security of the private key depends on the entropy of
        rand.
        
        Note that FIPS 186-3 section 4.6 specifies that the hash should be truncated
        to the byte-length of the subgroup. This function does not perform that
        truncation itself.
        
        Since Go 1.26, a secure source of random bytes is always used, and the Reader is
        ignored unless GODEBUG=cryptocustomrand=1 is set. This setting will be removed
        in a future Go release. Instead, use [testing/cryptotest.SetGlobalRandom].
        
        Be aware that calling Sign with an attacker-controlled [PrivateKey] may
        require an arbitrary amount of CPU.
    **/
    @:go.Tuple("r", "s", "err") @:native("Sign") static function sign(random: go.io.Reader, priv: go.Pointer<go.crypto.dsa.PrivateKey>, hash: go.Slice<go.Byte>): (go.Tuple<{ r: go.Pointer<go.math.big.Int>, s: go.Pointer<go.math.big.Int>, err: go.Error }>);
    /**
        Verify verifies the signature in r, s of hash using the public key, pub. It
        reports whether the signature is valid.
        
        Note that FIPS 186-3 section 4.6 specifies that the hash should be truncated
        to the byte-length of the subgroup. This function does not perform that
        truncation itself.
    **/
    @:native("Verify") static function verify(pub: go.Pointer<go.crypto.dsa.PublicKey>, hash: go.Slice<go.Byte>, r: go.Pointer<go.math.big.Int>, s: go.Pointer<go.math.big.Int>): (Bool);

}