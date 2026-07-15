package go.testing.quick;

@:go.Type({ name: "Generator", instanceName: "quick.Generator", imports: ["testing/quick"] })
extern typedef Generator = {

    @:native("Generate") function generate(rand: go.Pointer<go.math.rand.Rand>, size: go.GoInt): go.reflect.Value;

}