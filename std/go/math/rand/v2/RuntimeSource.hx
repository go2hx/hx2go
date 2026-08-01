package go.math.rand.v2;

@:structInit
@:go.Type({ name: "runtimeSource", instanceName: "v2.runtimeSource", imports: ["math/rand/v2"] })
extern class RuntimeSource {

    @:native("Uint64") function uint64(): (go.UInt64);

}