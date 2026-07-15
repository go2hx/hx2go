package go.expvar;

@:structInit
@:go.Type({ name: "String", instanceName: "expvar.String", imports: ["expvar"] })
extern class String {

    @:native("Set") function set(value: String): Void;
    @:native("String") function string(): String;
    @:native("Value") function value(): String;

}