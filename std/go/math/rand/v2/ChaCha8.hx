package go.math.rand.v2;

/**
    A ChaCha8 is a ChaCha8-based cryptographically strong
    random number generator.
**/
@:structInit
@:go.Type({ name: "ChaCha8", instanceName: "rand.ChaCha8", imports: ["math/rand/v2"] })
extern class ChaCha8 {

    /**
        AppendBinary implements the [encoding.BinaryAppender] interface.
    **/
    @:native("AppendBinary") function appendBinary(b: go.Slice<go.Byte>): (go.Result<go.Slice<go.Byte>>);
    /**
        MarshalBinary implements the [encoding.BinaryMarshaler] interface.
    **/
    @:native("MarshalBinary") function marshalBinary(): (go.Result<go.Slice<go.Byte>>);
    /**
        Read reads exactly len(p) bytes into p.
        It always returns len(p) and a nil error.
        
        If calls to Read and Uint64 are interleaved, the order in which bits are
        returned by the two is undefined, and Read may return bits generated before
        the last call to Uint64.
    **/
    @:native("Read") function read(p: go.Slice<go.Byte>): (go.Result<go.GoInt>);
    /**
        Seed resets the ChaCha8 to behave the same way as NewChaCha8(seed).
    **/
    @:native("Seed") function seed(seed: go.GoArray<go.Byte, 32>): Void;
    /**
        Uint64 returns a uniformly distributed random uint64 value.
    **/
    @:native("Uint64") function uint64(): (go.UInt64);
    /**
        UnmarshalBinary implements the [encoding.BinaryUnmarshaler] interface.
    **/
    @:native("UnmarshalBinary") function unmarshalBinary(data: go.Slice<go.Byte>): (go.Error);

}