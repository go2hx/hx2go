package go.crypto;

/**
    Package pbkdf2 implements the key derivation function PBKDF2 as defined in
    RFC 8018 (PKCS #5 v2.1).
    
    A key derivation function is useful when encrypting data based on a password
    or any other not-fully-random data. It uses a pseudorandom function to derive
    a secure encryption key based on the password.
**/
@:go.Type({ name: "pbkdf2", instanceName: "pbkdf2.pbkdf2", imports: ["crypto/pbkdf2"] })
extern class Pbkdf2 {

    /**
        Key derives a key from the password, salt and iteration count, returning a
        []byte of length keyLength that can be used as cryptographic key. The key is
        derived based on the method described as PBKDF2 with the HMAC variant using
        the supplied hash function.
        
        For example, to use a HMAC-SHA-1 based PBKDF2 key derivation function, you
        can get a derived key for e.g. AES-256 (which needs a 32-byte key) by
        doing:
        
        	dk, err := pbkdf2.Key(sha1.New, "some password", salt, 4096, 32)
        
        Remember to get a good random salt. At least 8 bytes is recommended by the
        RFC.
        
        Using a higher iteration count will increase the cost of an exhaustive
        search but will also make derivation proportionally slower.
        
        keyLength must be a positive integer between 1 and (2^32 - 1) * h.Size().
        Setting keyLength to a value outside of this range will result in an error.
    **/
    @:native("Key") static function key<Hash: go.hash.Hash>(h: () -> (Hash), password: String, salt: go.Slice<go.Byte>, iter: go.GoInt, keyLength: go.GoInt): (go.Result<go.Slice<go.Byte>>);

}