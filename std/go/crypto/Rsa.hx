package go.crypto;

/**
    Package rsa implements RSA encryption as specified in PKCS #1 and RFC 8017.
    
    RSA is a single, fundamental operation that is used in this package to
    implement either public-key encryption or public-key signatures.
    
    The original specification for encryption and signatures with RSA is PKCS #1
    and the terms "RSA encryption" and "RSA signatures" by default refer to
    PKCS #1 version 1.5. However, that specification has flaws and new designs
    should use version 2, usually called by just OAEP and PSS, where
    possible.
    
    Two sets of interfaces are included in this package. When a more abstract
    interface isn't necessary, there are functions for encrypting/decrypting
    with v1.5/OAEP and signing/verifying with v1.5/PSS. If one needs to abstract
    over the public key primitive, the PrivateKey type implements the
    Decrypter and Signer interfaces from the crypto package.
    
    Operations involving private keys are implemented using constant-time
    algorithms, except for [GenerateKey] and for some operations involving
    deprecated multi-prime keys.
    
    # Minimum key size
    
    [GenerateKey] returns an error if a key of less than 1024 bits is requested,
    and all Sign, Verify, Encrypt, and Decrypt methods return an error if used
    with a key smaller than 1024 bits. Such keys are insecure and should not be
    used.
    
    The rsa1024min=0 GODEBUG setting suppresses this error, but we recommend
    doing so only in tests, if necessary. Tests can set this option using
    [testing.T.Setenv] or by including "//go:debug rsa1024min=0" in a *_test.go
    source file.
    
    Alternatively, see the [GenerateKey (TestKey)] example for a pregenerated
    test-only 2048-bit key.
    
    [GenerateKey (TestKey)]: https://pkg.go.dev/crypto/rsa#example-GenerateKey-TestKey
**/
@:go.Type({ name: "rsa", instanceName: "rsa.rsa", imports: ["crypto/rsa"] })
extern class Rsa {

    @:native("PSSSaltLengthAuto") static var pSSSaltLengthAuto: go.GoInt;
    @:native("PSSSaltLengthEqualsHash") static var pSSSaltLengthEqualsHash: go.GoInt;

    /**
        DecryptOAEP decrypts ciphertext using RSA-OAEP.
        
        OAEP is parameterised by a hash function that is used as a random oracle.
        Encryption and decryption of a given message must use the same hash function
        and sha256.New() is a reasonable choice.
        
        The random parameter is legacy and ignored, and it can be nil.
        
        The label parameter must match the value given when encrypting. See
        [EncryptOAEP] for details.
    **/
    @:native("DecryptOAEP") static function decryptOAEP(hash: go.hash.Hash, random: go.io.Reader, priv: go.Pointer<go.crypto.rsa.PrivateKey>, ciphertext: go.Slice<go.Byte>, label: go.Slice<go.Byte>): (go.Result<go.Slice<go.Byte>>);
    /**
        DecryptPKCS1v15 decrypts a plaintext using RSA and the padding scheme from
        PKCS #1 v1.5. The random parameter is legacy and ignored, and it can be nil.
        
        Deprecated: PKCS #1 v1.5 encryption is dangerous and should not be used.
        Whether this function returns an error or not discloses secret information.
        If an attacker can cause this function to run repeatedly and learn whether
        each instance returned an error then they can decrypt and forge signatures as
        if they had the private key. See [draft-irtf-cfrg-rsa-guidance-05] for more
        information. Use [EncryptOAEP] and [DecryptOAEP] instead.
        
        [draft-irtf-cfrg-rsa-guidance-05]: https://www.ietf.org/archive/id/draft-irtf-cfrg-rsa-guidance-05.html#name-rationale
    **/
    @:native("DecryptPKCS1v15") static function decryptPKCS1v15(random: go.io.Reader, priv: go.Pointer<go.crypto.rsa.PrivateKey>, ciphertext: go.Slice<go.Byte>): (go.Result<go.Slice<go.Byte>>);
    /**
        DecryptPKCS1v15SessionKey decrypts a session key using RSA and the padding
        scheme from PKCS #1 v1.5. The random parameter is legacy and ignored, and it
        can be nil.
        
        DecryptPKCS1v15SessionKey returns an error if the ciphertext is the wrong
        length or if the ciphertext is greater than the public modulus. Otherwise, no
        error is returned. If the padding is valid, the resulting plaintext message
        is copied into key. Otherwise, key is unchanged. These alternatives occur in
        constant time. It is intended that the user of this function generate a
        random session key beforehand and continue the protocol with the resulting
        value.
        
        Note that if the session key is too small then it may be possible for an
        attacker to brute-force it. If they can do that then they can learn whether a
        random value was used (because it'll be different for the same ciphertext)
        and thus whether the padding was correct. This also defeats the point of this
        function. Using at least a 16-byte key will protect against this attack.
        
        This method implements protections against Bleichenbacher chosen ciphertext
        attacks [0] described in RFC 3218 Section 2.3.2 [1]. While these protections
        make a Bleichenbacher attack significantly more difficult, the protections
        are only effective if the rest of the protocol which uses
        DecryptPKCS1v15SessionKey is designed with these considerations in mind. In
        particular, if any subsequent operations which use the decrypted session key
        leak any information about the key (e.g. whether it is a static or random
        key) then the mitigations are defeated. This method must be used extremely
        carefully, and typically should only be used when absolutely necessary for
        compatibility with an existing protocol (such as TLS) that is designed with
        these properties in mind.
        
          - [0] “Chosen Ciphertext Attacks Against Protocols Based on the RSA Encryption
            Standard PKCS #1”, Daniel Bleichenbacher, Advances in Cryptology (Crypto '98)
          - [1] RFC 3218, Preventing the Million Message Attack on CMS,
            https://www.rfc-editor.org/rfc/rfc3218.html
        
        Deprecated: PKCS #1 v1.5 encryption is dangerous and should not be used. The
        protections implemented by this function are limited and fragile, as
        explained above. See [draft-irtf-cfrg-rsa-guidance-05] for more information.
        Use [EncryptOAEP] and [DecryptOAEP] instead.
        
        [draft-irtf-cfrg-rsa-guidance-05]: https://www.ietf.org/archive/id/draft-irtf-cfrg-rsa-guidance-05.html#name-rationale
    **/
    @:native("DecryptPKCS1v15SessionKey") static function decryptPKCS1v15SessionKey(random: go.io.Reader, priv: go.Pointer<go.crypto.rsa.PrivateKey>, ciphertext: go.Slice<go.Byte>, key: go.Slice<go.Byte>): (go.Error);
    /**
        EncryptOAEP encrypts the given message with RSA-OAEP.
        
        OAEP is parameterised by a hash function that is used as a random oracle.
        Encryption and decryption of a given message must use the same hash function
        and sha256.New() is a reasonable choice.
        
        The random parameter is used as a source of entropy to ensure that
        encrypting the same message twice doesn't result in the same ciphertext.
        Most applications should use [crypto/rand.Reader] as random.
        
        The label parameter may contain arbitrary data that will not be encrypted,
        but which gives important context to the message. For example, if a given
        public key is used to encrypt two types of messages then distinct label
        values could be used to ensure that a ciphertext for one purpose cannot be
        used for another by an attacker. If not required it can be empty.
        
        The message must be no longer than the length of the public modulus minus
        twice the hash length, minus a further 2.
    **/
    @:native("EncryptOAEP") static function encryptOAEP(hash: go.hash.Hash, random: go.io.Reader, pub: go.Pointer<go.crypto.rsa.PublicKey>, msg: go.Slice<go.Byte>, label: go.Slice<go.Byte>): (go.Result<go.Slice<go.Byte>>);
    /**
        EncryptOAEPWithOptions encrypts the given message with RSA-OAEP using the
        provided options.
        
        This function should only be used over [EncryptOAEP] when there is a need to
        specify the OAEP and MGF1 hashes separately.
        
        See [EncryptOAEP] for additional details.
    **/
    @:native("EncryptOAEPWithOptions") static function encryptOAEPWithOptions(random: go.io.Reader, pub: go.Pointer<go.crypto.rsa.PublicKey>, msg: go.Slice<go.Byte>, opts: go.Pointer<go.crypto.rsa.OAEPOptions>): (go.Result<go.Slice<go.Byte>>);
    /**
        EncryptPKCS1v15 encrypts the given message with RSA and the padding
        scheme from PKCS #1 v1.5.  The message must be no longer than the
        length of the public modulus minus 11 bytes.
        
        The random parameter is used as a source of entropy to ensure that encrypting
        the same message twice doesn't result in the same ciphertext. Since Go 1.26,
        a secure source of random bytes is always used, and the Reader is ignored
        unless GODEBUG=cryptocustomrand=1 is set. This setting will be removed in a
        future Go release. Instead, use [testing/cryptotest.SetGlobalRandom].
        
        Deprecated: PKCS #1 v1.5 encryption is dangerous and should not be used.
        See [draft-irtf-cfrg-rsa-guidance-05] for more information. Use
        [EncryptOAEP] and [DecryptOAEP] instead.
        
        [draft-irtf-cfrg-rsa-guidance-05]: https://www.ietf.org/archive/id/draft-irtf-cfrg-rsa-guidance-05.html#name-rationale
    **/
    @:native("EncryptPKCS1v15") static function encryptPKCS1v15(random: go.io.Reader, pub: go.Pointer<go.crypto.rsa.PublicKey>, msg: go.Slice<go.Byte>): (go.Result<go.Slice<go.Byte>>);
    /**
        GenerateKey generates a random RSA private key of the given bit size.
        
        If bits is less than 1024, [GenerateKey] returns an error. See the "[Minimum
        key size]" section for further details.
        
        Since Go 1.26, a secure source of random bytes is always used, and the Reader is
        ignored unless GODEBUG=cryptocustomrand=1 is set. This setting will be removed
        in a future Go release. Instead, use [testing/cryptotest.SetGlobalRandom].
        
        [Minimum key size]: https://pkg.go.dev/crypto/rsa#hdr-Minimum_key_size
    **/
    @:native("GenerateKey") static function generateKey(random: go.io.Reader, bits: go.GoInt): (go.Result<go.Pointer<go.crypto.rsa.PrivateKey>>);
    /**
        GenerateMultiPrimeKey generates a multi-prime RSA keypair of the given bit
        size and the given random source.
        
        Table 1 in "[On the Security of Multi-prime RSA]" suggests maximum numbers of
        primes for a given bit size.
        
        Although the public keys are compatible (actually, indistinguishable) from
        the 2-prime case, the private keys are not. Thus it may not be possible to
        export multi-prime private keys in certain formats or to subsequently import
        them into other code.
        
        This package does not implement CRT optimizations for multi-prime RSA, so the
        keys with more than two primes will have worse performance.
        
        Since Go 1.26, a secure source of random bytes is always used, and the Reader is
        ignored unless GODEBUG=cryptocustomrand=1 is set. This setting will be removed
        in a future Go release. Instead, use [testing/cryptotest.SetGlobalRandom].
        
        Deprecated: The use of this function with a number of primes different from
        two is not recommended for the above security, compatibility, and performance
        reasons. Use [GenerateKey] instead.
        
        [On the Security of Multi-prime RSA]: http://www.cacr.math.uwaterloo.ca/techreports/2006/cacr2006-16.pdf
    **/
    @:native("GenerateMultiPrimeKey") static function generateMultiPrimeKey(random: go.io.Reader, nprimes: go.GoInt, bits: go.GoInt): (go.Result<go.Pointer<go.crypto.rsa.PrivateKey>>);
    /**
        SignPKCS1v15 calculates the signature of hashed using
        RSASSA-PKCS1-V1_5-SIGN from RSA PKCS #1 v1.5.  Note that hashed must
        be the result of hashing the input message using the given hash
        function. If hash is zero, hashed is signed directly. This isn't
        advisable except for interoperability.
        
        The random parameter is legacy and ignored, and it can be nil.
        
        This function is deterministic. Thus, if the set of possible
        messages is small, an attacker may be able to build a map from
        messages to signatures and identify the signed messages. As ever,
        signatures provide authenticity, not confidentiality.
    **/
    @:native("SignPKCS1v15") static function signPKCS1v15(random: go.io.Reader, priv: go.Pointer<go.crypto.rsa.PrivateKey>, hash: go.crypto.Hash, hashed: go.Slice<go.Byte>): (go.Result<go.Slice<go.Byte>>);
    /**
        SignPSS calculates the signature of digest using PSS.
        
        digest must be the result of hashing the input message using the given hash
        function. The opts argument may be nil, in which case sensible defaults are
        used. If opts.Hash is set, it overrides hash.
        
        The signature is randomized depending on the message, key, and salt size,
        using bytes from random. Most applications should use [crypto/rand.Reader] as
        random.
    **/
    @:native("SignPSS") static function signPSS(random: go.io.Reader, priv: go.Pointer<go.crypto.rsa.PrivateKey>, hash: go.crypto.Hash, digest: go.Slice<go.Byte>, opts: go.Pointer<go.crypto.rsa.PSSOptions>): (go.Result<go.Slice<go.Byte>>);
    /**
        VerifyPKCS1v15 verifies an RSA PKCS #1 v1.5 signature.
        hashed is the result of hashing the input message using the given hash
        function and sig is the signature. A valid signature is indicated by
        returning a nil error. If hash is zero then hashed is used directly. This
        isn't advisable except for interoperability.
        
        The inputs are not considered confidential, and may leak through timing side
        channels, or if an attacker has control of part of the inputs.
    **/
    @:native("VerifyPKCS1v15") static function verifyPKCS1v15(pub: go.Pointer<go.crypto.rsa.PublicKey>, hash: go.crypto.Hash, hashed: go.Slice<go.Byte>, sig: go.Slice<go.Byte>): (go.Error);
    /**
        VerifyPSS verifies a PSS signature.
        
        A valid signature is indicated by returning a nil error. digest must be the
        result of hashing the input message using the given hash function. The opts
        argument may be nil, in which case sensible defaults are used. opts.Hash is
        ignored.
        
        The inputs are not considered confidential, and may leak through timing side
        channels, or if an attacker has control of part of the inputs.
    **/
    @:native("VerifyPSS") static function verifyPSS(pub: go.Pointer<go.crypto.rsa.PublicKey>, hash: go.crypto.Hash, digest: go.Slice<go.Byte>, sig: go.Slice<go.Byte>, opts: go.Pointer<go.crypto.rsa.PSSOptions>): (go.Error);

}