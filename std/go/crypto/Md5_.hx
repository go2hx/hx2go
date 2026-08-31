package go.crypto;

/**
    Package md5 implements the MD5 hash algorithm as defined in RFC 1321.
    
    MD5 is cryptographically broken and should not be used for secure
    applications.
**/
@:go.Type({ name: "md5", instanceName: "md5.md5", imports: ["crypto/md5"] })
extern class Md5_ {

    /**
        The blocksize of MD5 in bytes.
    **/
    @:native("BlockSize") static var blockSize: go.GoInt;
    /**
        The size of an MD5 checksum in bytes.
    **/
    @:native("Size") static var size: go.GoInt;

    /**
        New returns a new [hash.Hash] computing the MD5 checksum. The Hash
        also implements [encoding.BinaryMarshaler], [encoding.BinaryAppender] and
        [encoding.BinaryUnmarshaler] to marshal and unmarshal the internal
        state of the hash.
    **/
    @:native("New") static function _new(): (go.hash.Hash);
    /**
        Sum returns the MD5 checksum of the data.
    **/
    @:native("Sum") static function sum(data: go.Slice<go.Byte>): (go.GoArray<go.Byte, 16>);

}