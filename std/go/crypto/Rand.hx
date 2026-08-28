package go.crypto;

/**
    Package rand implements a cryptographically secure
    random number generator.
**/
@:go.Type({ name: "rand", instanceName: "rand.rand", imports: ["crypto/rand"] })
extern class Rand {

    /**
        Reader is a global, shared instance of a cryptographically
        secure random number generator. It is safe for concurrent use.
        
          - On Linux, FreeBSD, Dragonfly, and Solaris, Reader uses getrandom(2).
          - On legacy Linux (< 3.17), Reader opens /dev/urandom on first use.
          - On macOS, iOS, and OpenBSD Reader, uses arc4random_buf(3).
          - On NetBSD, Reader uses the kern.arandom sysctl.
          - On Windows, Reader uses the ProcessPrng API.
          - On js/wasm, Reader uses the Web Crypto API.
          - On wasip1/wasm, Reader uses random_get.
        
        In FIPS 140-3 mode, the output passes through an SP 800-90A Rev. 1
        Deterministric Random Bit Generator (DRBG).
    **/
    @:native("Reader") static var reader: go.io.Reader;

    /**
        Int returns a uniform random value in [0, max). It panics if max <= 0, and
        returns an error if rand.Read returns one.
    **/
    @:native("Int") static function int(rand: go.io.Reader, max: go.Pointer<go.math.big.Int>): (go.Result<go.Pointer<go.math.big.Int>>);
    /**
        Prime returns a number of the given bit length that is prime with high probability.
        Prime will return error for any error returned by rand.Read or if bits < 2.
        
        Since Go 1.26, a secure source of random bytes is always used, and the Reader is
        ignored unless GODEBUG=cryptocustomrand=1 is set. This setting will be removed
        in a future Go release. Instead, use [testing/cryptotest.SetGlobalRandom].
    **/
    @:native("Prime") static function prime(r: go.io.Reader, bits: go.GoInt): (go.Result<go.Pointer<go.math.big.Int>>);
    /**
        Read fills b with cryptographically secure random bytes. It never returns an
        error, and always fills b entirely.
        
        Read calls [io.ReadFull] on [Reader] and crashes the program irrecoverably if
        an error is returned. The default Reader uses operating system APIs that are
        documented to never return an error on all but legacy Linux systems.
    **/
    @:native("Read") static function read(b: go.Slice<go.Byte>): (go.Result<go.GoInt>);
    /**
        Text returns a cryptographically random string using the standard RFC 4648 base32 alphabet
        for use when a secret string, token, password, or other text is needed.
        The result contains at least 128 bits of randomness, enough to prevent brute force
        guessing attacks and to make the likelihood of collisions vanishingly small.
        A future version may return longer texts as needed to maintain those properties.
    **/
    @:native("Text") static function text(): (String);

}