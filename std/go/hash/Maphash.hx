package go.hash;

/**
    Package maphash provides hash functions on byte sequences and comparable values.
    These hash functions are intended to be used to implement hash tables or
    other data structures that need to map arbitrary strings or byte
    sequences to a uniform distribution on unsigned 64-bit integers.
    Each different instance of a hash table or data structure should use its own [Seed].
    
    The hash functions are not cryptographically secure.
    (See crypto/sha256 and crypto/sha512 for cryptographic use.)
**/
@:go.Type({ name: "maphash", instanceName: "maphash.maphash", imports: ["hash/maphash"] })
extern class Maphash {

    /**
        Bytes returns the hash of b with the given seed.
        
        Bytes is equivalent to, but more convenient and efficient than:
        
        	var h Hash
        	h.SetSeed(seed)
        	h.Write(b)
        	return h.Sum64()
    **/
    @:native("Bytes") static function bytes(seed: go.hash.maphash.Seed, b: go.Slice<go.Byte>): (go.UInt64);
    /**
        Comparable returns the hash of comparable value v with the given seed
        such that Comparable(s, v1) == Comparable(s, v2) if v1 == v2.
        If v != v, then the resulting hash is randomly distributed.
    **/
    @:native("Comparable") static function comparable<T: go.Comparable>(seed: go.hash.maphash.Seed, v: T): (go.UInt64);
    /**
        MakeSeed returns a new random seed.
    **/
    @:native("MakeSeed") static function makeSeed(): (go.hash.maphash.Seed);
    /**
        String returns the hash of s with the given seed.
        
        String is equivalent to, but more convenient and efficient than:
        
        	var h Hash
        	h.SetSeed(seed)
        	h.WriteString(s)
        	return h.Sum64()
    **/
    @:native("String") static function string(seed: go.hash.maphash.Seed, s: std.String): (go.UInt64);
    /**
        WriteComparable adds x to the data hashed by h.
    **/
    @:native("WriteComparable") static function writeComparable<T: go.Comparable>(h: go.Pointer<go.hash.maphash.Hash>, x: T): Void;

}