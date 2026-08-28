package go.math.rand.v2;

/**
    A PCG is a PCG generator with 128 bits of internal state.
    A zero PCG is equivalent to NewPCG(0, 0).
**/
@:structInit
@:go.Type({ name: "PCG", instanceName: "rand.PCG", imports: ["math/rand/v2"] })
extern class PCG {

    /**
        AppendBinary implements the [encoding.BinaryAppender] interface.
    **/
    @:native("AppendBinary") function appendBinary(b: go.Slice<go.Byte>): (go.Result<go.Slice<go.Byte>>);
    /**
        MarshalBinary implements the [encoding.BinaryMarshaler] interface.
    **/
    @:native("MarshalBinary") function marshalBinary(): (go.Result<go.Slice<go.Byte>>);
    /**
        Seed resets the PCG to behave the same way as NewPCG(seed1, seed2).
    **/
    @:native("Seed") function seed(seed1: go.UInt64, seed2: go.UInt64): Void;
    /**
        Uint64 return a uniformly-distributed random uint64 value.
    **/
    @:native("Uint64") function uint64(): (go.UInt64);
    /**
        UnmarshalBinary implements the [encoding.BinaryUnmarshaler] interface.
    **/
    @:native("UnmarshalBinary") function unmarshalBinary(data: go.Slice<go.Byte>): (go.Error);

}