package go.hash;

/**
    Package fnv implements FNV-1 and FNV-1a, non-cryptographic hash functions
    created by Glenn Fowler, Landon Curt Noll, and Phong Vo.
    See
    https://en.wikipedia.org/wiki/Fowler-Noll-Vo_hash_function.
    
    All the hash.Hash implementations returned by this package also
    implement encoding.BinaryMarshaler and encoding.BinaryUnmarshaler to
    marshal and unmarshal the internal state of the hash.
**/
@:go.Type({ name: "fnv", instanceName: "fnv.fnv", imports: ["hash/fnv"] })
extern class Fnv {

    /**
        New128 returns a new 128-bit FNV-1 [hash.Hash].
        Its Sum method will lay the value out in big-endian byte order.
    **/
    @:native("New128") static function new128(): (go.hash.Hash);
    /**
        New128a returns a new 128-bit FNV-1a [hash.Hash].
        Its Sum method will lay the value out in big-endian byte order.
    **/
    @:native("New128a") static function new128a(): (go.hash.Hash);
    /**
        New32 returns a new 32-bit FNV-1 [hash.Hash].
        Its Sum method will lay the value out in big-endian byte order.
    **/
    @:native("New32") static function new32(): (go.hash.Hash32);
    /**
        New32a returns a new 32-bit FNV-1a [hash.Hash].
        Its Sum method will lay the value out in big-endian byte order.
    **/
    @:native("New32a") static function new32a(): (go.hash.Hash32);
    /**
        New64 returns a new 64-bit FNV-1 [hash.Hash].
        Its Sum method will lay the value out in big-endian byte order.
    **/
    @:native("New64") static function new64(): (go.hash.Hash64);
    /**
        New64a returns a new 64-bit FNV-1a [hash.Hash].
        Its Sum method will lay the value out in big-endian byte order.
    **/
    @:native("New64a") static function new64a(): (go.hash.Hash64);

}