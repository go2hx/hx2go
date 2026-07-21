package go.math.rand;

@:structInit
@:go.Type({ name: "runtimeSource", instanceName: "rand.runtimeSource", imports: ["math/rand"] })
extern class RuntimeSource {

    @:native("Int63") function int63(): (go.Int64);
    @:native("Seed") function seed(p0: go.Int64): Void;
    @:native("Uint64") function uint64(): (go.UInt64);

}