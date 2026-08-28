package go.crypto;

/**
    Package sha256 implements the SHA224 and SHA256 hash algorithms as defined
    in FIPS 180-4.
**/
@:go.Type({ name: "sha256", instanceName: "sha256.sha256", imports: ["crypto/sha256"] })
extern class Sha256_ {

    /**
        The blocksize of SHA256 and SHA224 in bytes.
    **/
    @:native("BlockSize") static var blockSize: go.GoInt;
    /**
        The size of a SHA256 checksum in bytes.
    **/
    @:native("Size") static var size: go.GoInt;
    /**
        The size of a SHA224 checksum in bytes.
    **/
    @:native("Size224") static var size224: go.GoInt;

    /**
        New returns a new [hash.Hash] computing the SHA256 checksum. The Hash
        also implements [encoding.BinaryMarshaler], [encoding.BinaryAppender] and
        [encoding.BinaryUnmarshaler] to marshal and unmarshal the internal
        state of the hash.
    **/
    @:native("New") static function _new(): (go.hash.Hash);
    /**
        New224 returns a new [hash.Hash] computing the SHA224 checksum. The Hash
        also implements [encoding.BinaryMarshaler], [encoding.BinaryAppender] and
        [encoding.BinaryUnmarshaler] to marshal and unmarshal the internal
        state of the hash.
    **/
    @:native("New224") static function new224(): (go.hash.Hash);
    /**
        Sum224 returns the SHA224 checksum of the data.
    **/
    @:native("Sum224") static function sum224(data: go.Slice<go.Byte>): (go.GoArray<go.Byte, 28>);
    /**
        Sum256 returns the SHA256 checksum of the data.
    **/
    @:native("Sum256") static function sum256(data: go.Slice<go.Byte>): (go.GoArray<go.Byte, 32>);

}