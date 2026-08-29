package go.crypto;

/**
    Package des implements the Data Encryption Standard (DES) and the
    Triple Data Encryption Algorithm (TDEA) as defined
    in U.S. Federal Information Processing Standards Publication 46-3.
    
    DES is cryptographically broken and should not be used for secure
    applications.
**/
@:go.Type({ name: "des", instanceName: "des.des", imports: ["crypto/des"] })
extern class Des {

    /**
        The DES block size in bytes.
    **/
    @:native("BlockSize") static var blockSize: go.GoInt;

    /**
        NewCipher creates and returns a new [cipher.Block].
    **/
    @:native("NewCipher") static function newCipher(key: go.Slice<go.Byte>): (go.Result<go.crypto.cipher.Block>);
    /**
        NewTripleDESCipher creates and returns a new [cipher.Block].
    **/
    @:native("NewTripleDESCipher") static function newTripleDESCipher(key: go.Slice<go.Byte>): (go.Result<go.crypto.cipher.Block>);

}