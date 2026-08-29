package go.crypto;

/**
    Package cipher implements standard block cipher modes that can be wrapped
    around low-level block cipher implementations.
    See https://csrc.nist.gov/groups/ST/toolkit/BCM/current_modes.html
    and NIST Special Publication 800-38A.
**/
@:go.Type({ name: "cipher", instanceName: "cipher.cipher", imports: ["crypto/cipher"] })
extern class Cipher {

    /**
        NewCBCDecrypter returns a BlockMode which decrypts in cipher block chaining
        mode, using the given Block. The length of iv must be the same as the
        Block's block size and must match the iv used to encrypt the data.
    **/
    @:native("NewCBCDecrypter") static function newCBCDecrypter(b: go.crypto.cipher.Block, iv: go.Slice<go.Byte>): (go.crypto.cipher.BlockMode);
    /**
        NewCBCEncrypter returns a BlockMode which encrypts in cipher block chaining
        mode, using the given Block. The length of iv must be the same as the
        Block's block size.
    **/
    @:native("NewCBCEncrypter") static function newCBCEncrypter(b: go.crypto.cipher.Block, iv: go.Slice<go.Byte>): (go.crypto.cipher.BlockMode);
    /**
        NewCFBDecrypter returns a [Stream] which decrypts with cipher feedback mode,
        using the given [Block]. The iv must be the same length as the [Block]'s block
        size.
        
        Deprecated: CFB mode is not authenticated, which generally enables active
        attacks to manipulate and recover the plaintext. It is recommended that
        applications use [AEAD] modes instead. The standard library implementation of
        CFB is also unoptimized and not validated as part of the FIPS 140-3 module.
        If an unauthenticated [Stream] mode is required, use [NewCTR] instead.
    **/
    @:native("NewCFBDecrypter") static function newCFBDecrypter(block: go.crypto.cipher.Block, iv: go.Slice<go.Byte>): (go.crypto.cipher.Stream);
    /**
        NewCFBEncrypter returns a [Stream] which encrypts with cipher feedback mode,
        using the given [Block]. The iv must be the same length as the [Block]'s block
        size.
        
        Deprecated: CFB mode is not authenticated, which generally enables active
        attacks to manipulate and recover the plaintext. It is recommended that
        applications use [AEAD] modes instead. The standard library implementation of
        CFB is also unoptimized and not validated as part of the FIPS 140-3 module.
        If an unauthenticated [Stream] mode is required, use [NewCTR] instead.
    **/
    @:native("NewCFBEncrypter") static function newCFBEncrypter(block: go.crypto.cipher.Block, iv: go.Slice<go.Byte>): (go.crypto.cipher.Stream);
    /**
        NewCTR returns a [Stream] which encrypts/decrypts using the given [Block] in
        counter mode. The length of iv must be the same as the [Block]'s block size.
    **/
    @:native("NewCTR") static function newCTR(block: go.crypto.cipher.Block, iv: go.Slice<go.Byte>): (go.crypto.cipher.Stream);
    /**
        NewGCM returns the given 128-bit, block cipher wrapped in Galois Counter Mode
        with the standard nonce length.
        
        In general, the GHASH operation performed by this implementation of GCM is not constant-time.
        An exception is when the underlying [Block] was created by aes.NewCipher
        on systems with hardware support for AES. See the [crypto/aes] package documentation for details.
    **/
    @:native("NewGCM") static function newGCM(cipher: go.crypto.cipher.Block): (go.Result<go.crypto.cipher.AEAD>);
    /**
        NewGCMWithNonceSize returns the given 128-bit, block cipher wrapped in Galois
        Counter Mode, which accepts nonces of the given length. The length must not
        be zero.
        
        Only use this function if you require compatibility with an existing
        cryptosystem that uses non-standard nonce lengths. All other users should use
        [NewGCM], which is faster and more resistant to misuse.
    **/
    @:native("NewGCMWithNonceSize") static function newGCMWithNonceSize(cipher: go.crypto.cipher.Block, size: go.GoInt): (go.Result<go.crypto.cipher.AEAD>);
    /**
        NewGCMWithRandomNonce returns the given cipher wrapped in Galois Counter
        Mode, with randomly-generated nonces. The cipher must have been created by
        [crypto/aes.NewCipher].
        
        It generates a random 96-bit nonce, which is prepended to the ciphertext by Seal,
        and is extracted from the ciphertext by Open. The NonceSize of the AEAD is zero,
        while the Overhead is 28 bytes (the combination of nonce size and tag size).
        
        A given key MUST NOT be used to encrypt more than 2^32 messages, to limit the
        risk of a random nonce collision to negligible levels.
    **/
    @:native("NewGCMWithRandomNonce") static function newGCMWithRandomNonce(cipher: go.crypto.cipher.Block): (go.Result<go.crypto.cipher.AEAD>);
    /**
        NewGCMWithTagSize returns the given 128-bit, block cipher wrapped in Galois
        Counter Mode, which generates tags with the given length.
        
        Tag sizes between 12 and 16 bytes are allowed.
        
        Only use this function if you require compatibility with an existing
        cryptosystem that uses non-standard tag lengths. All other users should use
        [NewGCM], which is more resistant to misuse.
    **/
    @:native("NewGCMWithTagSize") static function newGCMWithTagSize(cipher: go.crypto.cipher.Block, tagSize: go.GoInt): (go.Result<go.crypto.cipher.AEAD>);
    /**
        NewOFB returns a [Stream] that encrypts or decrypts using the block cipher b
        in output feedback mode. The initialization vector iv's length must be equal
        to b's block size.
        
        Deprecated: OFB mode is not authenticated, which generally enables active
        attacks to manipulate and recover the plaintext. It is recommended that
        applications use [AEAD] modes instead. The standard library implementation of
        OFB is also unoptimized and not validated as part of the FIPS 140-3 module.
        If an unauthenticated [Stream] mode is required, use [NewCTR] instead.
    **/
    @:native("NewOFB") static function newOFB(b: go.crypto.cipher.Block, iv: go.Slice<go.Byte>): (go.crypto.cipher.Stream);

}