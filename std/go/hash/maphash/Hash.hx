package go.hash.maphash;

/**
    A Hash computes a seeded hash of a byte sequence.
    
    The zero Hash is a valid Hash ready to use.
    A zero Hash chooses a random seed for itself during
    the first call to a Reset, Write, Seed, Clone, or Sum64 method.
    For control over the seed, use SetSeed.
    
    The computed hash values depend only on the initial seed and
    the sequence of bytes provided to the Hash object, not on the way
    in which the bytes are provided. For example, the three sequences
    
    	h.Write([]byte{'f','o','o'})
    	h.WriteByte('f'); h.WriteByte('o'); h.WriteByte('o')
    	h.WriteString("foo")
    
    all have the same effect.
    
    Hashes are intended to be collision-resistant, even for situations
    where an adversary controls the byte sequences being hashed.
    
    A Hash is not safe for concurrent use by multiple goroutines, but a Seed is.
    If multiple goroutines must compute the same seeded hash,
    each can declare its own Hash and call SetSeed with a common Seed.
**/
@:structInit
@:go.Type({ name: "Hash", instanceName: "maphash.Hash", imports: ["hash/maphash"] })
extern class Hash {

    /**
        BlockSize returns h's block size.
    **/
    @:native("BlockSize") function blockSize(): (go.GoInt);
    /**
        Clone implements [hash.Cloner].
    **/
    @:native("Clone") function clone(): (go.Result<go.hash.Cloner>);
    /**
        Reset discards all bytes added to h.
        (The seed remains the same.)
    **/
    @:native("Reset") function reset(): Void;
    /**
        Seed returns h's seed value.
    **/
    @:native("Seed") function seed(): (go.hash.maphash.Seed);
    /**
        SetSeed sets h to use seed, which must have been returned by [MakeSeed]
        or by another [Hash.Seed] method.
        Two [Hash] objects with the same seed behave identically.
        Two [Hash] objects with different seeds will very likely behave differently.
        Any bytes added to h before this call will be discarded.
    **/
    @:native("SetSeed") function setSeed(seed: go.hash.maphash.Seed): Void;
    /**
        Size returns h's hash value size, 8 bytes.
    **/
    @:native("Size") function size(): (go.GoInt);
    /**
        Sum appends the hash's current 64-bit value to b.
        It exists for implementing [hash.Hash].
        For direct calls, it is more efficient to use [Hash.Sum64].
    **/
    @:native("Sum") function sum(b: go.Slice<go.Byte>): (go.Slice<go.Byte>);
    /**
        Sum64 returns h's current 64-bit value, which depends on
        h's seed and the sequence of bytes added to h since the
        last call to [Hash.Reset] or [Hash.SetSeed].
        
        All bits of the Sum64 result are close to uniformly and
        independently distributed, so it can be safely reduced
        by using bit masking, shifting, or modular arithmetic.
    **/
    @:native("Sum64") function sum64(): (go.UInt64);
    /**
        Write adds b to the sequence of bytes hashed by h.
        It always writes all of b and never fails; the count and error result are for implementing [io.Writer].
    **/
    @:native("Write") function write(b: go.Slice<go.Byte>): (go.Result<go.GoInt>);
    /**
        WriteByte adds b to the sequence of bytes hashed by h.
        It never fails; the error result is for implementing [io.ByteWriter].
    **/
    @:native("WriteByte") function writeByte(b: go.Byte): (go.Error);
    /**
        WriteString adds the bytes of s to the sequence of bytes hashed by h.
        It always writes all of s and never fails; the count and error result are for implementing [io.StringWriter].
    **/
    @:native("WriteString") function writeString(s: std.String): (go.Result<go.GoInt>);

}