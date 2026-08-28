package go.hash;

/**
    Hash is the common interface implemented by all hash functions.
    
    Hash implementations in the standard library (e.g. [hash/crc32] and
    [crypto/sha256]) implement the [encoding.BinaryMarshaler], [encoding.BinaryAppender],
    [encoding.BinaryUnmarshaler] and [Cloner] interfaces. Marshaling a hash implementation
    allows its internal state to be saved and used for additional processing
    later, without having to re-write the data previously written to the hash.
    The hash state may contain portions of the input in its original form,
    which users are expected to handle for any possible security implications.
    
    Compatibility: Any future changes to hash or crypto packages will endeavor
    to maintain compatibility with state encoded using previous versions.
    That is, any released versions of the packages should be able to
    decode data written with any previously released version,
    subject to issues such as security fixes.
    See the Go compatibility document for background: https://golang.org/doc/go1compat
**/
@:go.Type({ name: "Hash", instanceName: "hash.Hash", imports: ["hash"] })
extern typedef Hash = {

    @:native("BlockSize") function blockSize(): (go.GoInt);
    @:native("Reset") function reset(): Void;
    @:native("Size") function size(): (go.GoInt);
    @:native("Sum") function sum(b: go.Slice<go.Byte>): (go.Slice<go.Byte>);
    @:native("Write") function write(p: go.Slice<go.Byte>): (go.Result<go.GoInt>);

}