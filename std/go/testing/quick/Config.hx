package go.testing.quick;

@:structInit
@:go.Type({ name: "Config", instanceName: "quick.Config", imports: ["testing/quick"] })
extern class Config {

    @:native("MaxCount") var maxCount: go.GoInt;
    @:native("MaxCountScale") var maxCountScale: Float;
    @:native("Rand") var rand: go.Pointer<go.math.rand.Rand>;
    @:native("Values") var values: (p0: go.Slice<go.reflect.Value>, p1: go.Pointer<go.math.rand.Rand>) -> Void;

    function new(maxCount: go.GoInt=0, maxCountScale: Float=0.0, rand: go.Pointer<go.math.rand.Rand>=null, values: (p0: go.Slice<go.reflect.Value>, p1: go.Pointer<go.math.rand.Rand>) -> Void=null);

}