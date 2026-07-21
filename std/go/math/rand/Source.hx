package go.math.rand;

@:go.Type({ name: "Source", instanceName: "rand.Source", imports: ["math/rand"] })
extern typedef Source = {

    @:native("Int63") function int63(): (go.Int64);
    @:native("Seed") function seed(seed: go.Int64): Void;

}