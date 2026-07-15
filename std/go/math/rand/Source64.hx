package go.math.rand;

@:go.Type({ name: "Source64", instanceName: "rand.Source64", imports: ["math/rand"] })
extern typedef Source64 = {

    @:native("Int63") function int63(): go.Int64;
    @:native("Seed") function seed(seed: go.Int64): Void;
    @:native("Uint64") function uint64(): go.UInt64;

}