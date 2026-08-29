package go.crypto;

/**
    Package aes implements AES encryption (formerly Rijndael), as defined in
    U.S. Federal Information Processing Standards Publication 197.
    
    The AES operations in this package are not implemented using constant-time algorithms.
    An exception is when running on systems with enabled hardware support for AES
    that makes these operations constant-time. Examples include amd64 systems using AES-NI
    extensions and s390x systems using Message-Security-Assist extensions.
    On such systems, when the result of NewCipher is passed to cipher.NewGCM,
    the GHASH operation used by GCM is also constant-time.
**/
@:go.Type({ name: "aes", instanceName: "aes.aes", imports: ["crypto/aes"] })
extern class Aes {

    /**
        The AES block size in bytes.
    **/
    @:native("BlockSize") static var blockSize: go.GoInt;

    /**
        NewCipher creates and returns a new [cipher.Block].
        The key argument must be the AES key,
        either 16, 24, or 32 bytes to select
        AES-128, AES-192, or AES-256.
    **/
    @:native("NewCipher") static function newCipher(key: go.Slice<go.Byte>): (go.Result<go.crypto.cipher.Block>);

}