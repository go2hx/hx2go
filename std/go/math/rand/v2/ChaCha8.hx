package go.math.rand.v2;

@:structInit
@:go.Type({ name: "ChaCha8", instanceName: "v2.ChaCha8", imports: ["math/rand/v2"] })
extern class ChaCha8 {

    @:native("AppendBinary") function appendBinary(b: go.Slice<go.Byte>): go.Result<go.Slice<go.Byte>>;
    @:native("MarshalBinary") function marshalBinary(): go.Result<go.Slice<go.Byte>>;
    @:native("Read") function read(p: go.Slice<go.Byte>): go.Result<go.GoInt>;
    @:native("Seed") function seed(seed: go.GoArray<go.Byte, 32>): Void;
    @:native("Uint64") function uint64(): go.UInt64;
    @:native("UnmarshalBinary") function unmarshalBinary(data: go.Slice<go.Byte>): go.Error;

}