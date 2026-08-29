package go.expvar;

/**
    Int is a 64-bit integer variable that satisfies the [Var] interface.
**/
@:structInit
@:go.Type({ name: "Int", instanceName: "expvar.Int", imports: ["expvar"] })
extern class Int {

    @:native("Add") function add(delta: go.Int64): Void;
    @:native("Set") function set(value: go.Int64): Void;
    @:native("String") function string(): (std.String);
    @:native("Value") function value(): (go.Int64);

}