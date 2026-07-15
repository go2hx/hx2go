package go.math.rand.v2;

@:go.Type({ name: "Source", instanceName: "v2.Source", imports: ["math/rand/v2"] })
extern typedef Source = {

    @:native("Uint64") function uint64(): go.UInt64;

}