package go.math.rand.v2;

@:structInit
@:go.Type({ name: "Zipf", instanceName: "rand.Zipf", imports: ["math/rand/v2"] })
extern class Zipf {

    @:native("Uint64") function uint64(): (go.UInt64);

}