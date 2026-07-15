package go.testing;

@:go.Type({ name: "quick", instanceName: "quick.quick", imports: ["testing/quick"] })
extern class Quick {

    @:native("Check") static function check(f: Dynamic, config: go.Pointer<go.testing.quick.Config>): go.Error;
    @:native("CheckEqual") static function checkEqual(f: Dynamic, g: Dynamic, config: go.Pointer<go.testing.quick.Config>): go.Error;
    @:go.Tuple("value", "ok") @:native("Value") static function value(t: go.reflect.Type, rand: go.Pointer<go.math.rand.Rand>): go.Tuple<{ value: go.reflect.Value, ok: Bool }>;

}