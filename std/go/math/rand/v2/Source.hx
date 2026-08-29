package go.math.rand.v2;

/**
    A Source is a source of uniformly-distributed
    pseudo-random uint64 values in the range [0, 1<<64).
    
    A Source is not safe for concurrent use by multiple goroutines.
**/
@:go.Type({ name: "Source", instanceName: "rand.Source", imports: ["math/rand/v2"] })
extern typedef Source = {

    @:native("Uint64") function uint64(): (go.UInt64);

}