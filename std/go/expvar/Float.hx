package go.expvar;

/**
    Float is a 64-bit float variable that satisfies the [Var] interface.
**/
@:structInit
@:go.Type({ name: "Float", instanceName: "expvar.Float", imports: ["expvar"] })
extern class Float {

    /**
        Add adds delta to v.
    **/
    @:native("Add") function add(delta: Float): Void;
    /**
        Set sets v to value.
    **/
    @:native("Set") function set(value: Float): Void;
    @:native("String") function string(): (std.String);
    @:native("Value") function value(): (Float);

}