package go.math.rand.v2;

/**
    A Zipf generates Zipf distributed variates.
**/
@:structInit
@:go.Type({ name: "Zipf", instanceName: "rand.Zipf", imports: ["math/rand/v2"] })
extern class Zipf {

    /**
        Uint64 returns a value drawn from the Zipf distribution described
        by the Zipf object.
    **/
    @:native("Uint64") function uint64(): (go.UInt64);

}