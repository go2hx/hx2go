package go.crypto;

/**
    Package sha1 implements the SHA-1 hash algorithm as defined in RFC 3174.
    
    SHA-1 is cryptographically broken and should not be used for secure
    applications.
**/
@:go.Type({ name: "sha1", instanceName: "sha1.sha1", imports: ["crypto/sha1"] })
extern class Sha1_ {

    /**
        The blocksize of SHA-1 in bytes.
    **/
    @:native("BlockSize") static var blockSize: go.GoInt;
    /**
        The size of a SHA-1 checksum in bytes.
    **/
    @:native("Size") static var size: go.GoInt;

    /**
        New returns a new [hash.Hash] computing the SHA1 checksum. The Hash
        also implements [encoding.BinaryMarshaler], [encoding.BinaryAppender] and
        [encoding.BinaryUnmarshaler] to marshal and unmarshal the internal
        state of the hash.
    **/
    @:native("New") static function _new(): (go.hash.Hash);
    /**
        Sum returns the SHA-1 checksum of the data.
    **/
    @:native("Sum") static function sum(data: go.Slice<go.Byte>): (go.GoArray<go.Byte, 20>);

}