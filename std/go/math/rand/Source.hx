package go.math.rand;

/**
    A Source represents a source of uniformly-distributed
    pseudo-random int64 values in the range [0, 1<<63).
    
    A Source is not safe for concurrent use by multiple goroutines.
**/
@:go.Type({ name: "Source", instanceName: "rand.Source", imports: ["math/rand"] })
extern typedef Source = {

    @:native("Int63") function int63(): (go.Int64);
    @:native("Seed") function seed(seed: go.Int64): Void;

}