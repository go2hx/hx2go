package go.math.rand;

@:structInit
@:go.Type({ name: "Zipf", instanceName: "rand.Zipf", imports: ["math/rand"] })
extern class Zipf {

    @:native("Uint64") function uint64(): (go.UInt64);

}