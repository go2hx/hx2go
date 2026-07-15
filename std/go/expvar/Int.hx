package go.expvar;

@:structInit
@:go.Type({ name: "Int", instanceName: "expvar.Int", imports: ["expvar"] })
extern class Int {

    @:native("Add") function add(delta: go.Int64): Void;
    @:native("Set") function set(value: go.Int64): Void;
    @:native("String") function string(): String;
    @:native("Value") function value(): go.Int64;

}