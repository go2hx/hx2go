package go.expvar;

@:structInit
@:go.Type({ name: "String", instanceName: "expvar.String", imports: ["expvar"] })
extern class String {

    @:native("Set") function set(value: std.String): Void;
    @:native("String") function string(): (std.String);
    @:native("Value") function value(): (std.String);

}