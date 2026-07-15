package go.math.rand.v2;

@:structInit
@:go.Type({ name: "PCG", instanceName: "v2.PCG", imports: ["math/rand/v2"] })
extern class PCG {

    @:native("AppendBinary") function appendBinary(b: go.Slice<go.Byte>): go.Result<go.Slice<go.Byte>>;
    @:native("MarshalBinary") function marshalBinary(): go.Result<go.Slice<go.Byte>>;
    @:native("Seed") function seed(seed1: go.UInt64, seed2: go.UInt64): Void;
    @:native("Uint64") function uint64(): go.UInt64;
    @:native("UnmarshalBinary") function unmarshalBinary(data: go.Slice<go.Byte>): go.Error;

}