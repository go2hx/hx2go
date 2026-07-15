package go.expvar;

@:structInit
@:go.Type({ name: "Float", instanceName: "expvar.Float", imports: ["expvar"] })
extern class Float {

    @:native("Add") function add(delta: Float): Void;
    @:native("Set") function set(value: Float): Void;
    @:native("String") function string(): String;
    @:native("Value") function value(): Float;

}