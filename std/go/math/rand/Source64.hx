package go.math.rand;

/**
    A Source64 is a [Source] that can also generate
    uniformly-distributed pseudo-random uint64 values in
    the range [0, 1<<64) directly.
    If a [Rand] r's underlying [Source] s implements Source64,
    then r.Uint64 returns the result of one call to s.Uint64
    instead of making two calls to s.Int63.
**/
@:go.Type({ name: "Source64", instanceName: "rand.Source64", imports: ["math/rand"] })
extern typedef Source64 = {

    @:native("Int63") function int63(): (go.Int64);
    @:native("Seed") function seed(seed: go.Int64): Void;
    @:native("Uint64") function uint64(): (go.UInt64);

}