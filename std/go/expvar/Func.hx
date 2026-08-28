package go.expvar;

@:go.Type({ name: "Func", instanceName: "expvar.Func", imports: ["expvar"] })
extern class Func {

    @:native("String") function string(): (std.String);
    @:native("Value") function value(): (Dynamic);

}