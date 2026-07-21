package go.math.rand;

@:structInit
@:go.Type({ name: "lockedSource", instanceName: "rand.lockedSource", imports: ["math/rand"] })
extern class LockedSource {

    @:native("Int63") function int63(): (go.Int64);
    @:native("Seed") function seed(seed: go.Int64): Void;
    @:native("Uint64") function uint64(): (go.UInt64);

}