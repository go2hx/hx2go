package go.crypto;

/**
    Package sha512 implements the SHA-384, SHA-512, SHA-512/224, and SHA-512/256
    hash algorithms as defined in FIPS 180-4.
    
    All the hash.Hash implementations returned by this package also
    implement encoding.BinaryMarshaler and encoding.BinaryUnmarshaler to
    marshal and unmarshal the internal state of the hash.
**/
@:go.Type({ name: "sha512", instanceName: "sha512.sha512", imports: ["crypto/sha512"] })
extern class Sha512_ {

    @:native("BlockSize") static var blockSize: go.GoInt;
    @:native("Size") static var size: go.GoInt;
    @:native("Size224") static var size224: go.GoInt;
    @:native("Size256") static var size256: go.GoInt;
    @:native("Size384") static var size384: go.GoInt;

    /**
        New returns a new [hash.Hash] computing the SHA-512 checksum. The Hash
        also implements [encoding.BinaryMarshaler], [encoding.BinaryAppender] and
        [encoding.BinaryUnmarshaler] to marshal and unmarshal the internal
        state of the hash.
    **/
    @:native("New") static function _new(): (go.hash.Hash);
    /**
        New384 returns a new [hash.Hash] computing the SHA-384 checksum. The Hash
        also implements [encoding.BinaryMarshaler], [encoding.BinaryAppender] and
        [encoding.BinaryUnmarshaler] to marshal and unmarshal the internal
        state of the hash.
    **/
    @:native("New384") static function new384(): (go.hash.Hash);
    /**
        New512_224 returns a new [hash.Hash] computing the SHA-512/224 checksum. The Hash
        also implements [encoding.BinaryMarshaler], [encoding.BinaryAppender] and
        [encoding.BinaryUnmarshaler] to marshal and unmarshal the internal
        state of the hash.
    **/
    @:native("New512_224") static function new512_224(): (go.hash.Hash);
    /**
        New512_256 returns a new [hash.Hash] computing the SHA-512/256 checksum. The Hash
        also implements [encoding.BinaryMarshaler], [encoding.BinaryAppender] and
        [encoding.BinaryUnmarshaler] to marshal and unmarshal the internal
        state of the hash.
    **/
    @:native("New512_256") static function new512_256(): (go.hash.Hash);
    /**
        Sum384 returns the SHA384 checksum of the data.
    **/
    @:native("Sum384") static function sum384(data: go.Slice<go.Byte>): (go.GoArray<go.Byte, 48>);
    /**
        Sum512 returns the SHA512 checksum of the data.
    **/
    @:native("Sum512") static function sum512(data: go.Slice<go.Byte>): (go.GoArray<go.Byte, 64>);
    /**
        Sum512_224 returns the Sum512/224 checksum of the data.
    **/
    @:native("Sum512_224") static function sum512_224(data: go.Slice<go.Byte>): (go.GoArray<go.Byte, 28>);
    /**
        Sum512_256 returns the Sum512/256 checksum of the data.
    **/
    @:native("Sum512_256") static function sum512_256(data: go.Slice<go.Byte>): (go.GoArray<go.Byte, 32>);

}