package go.expvar;

@:go.Type({ name: "Func", instanceName: "expvar.Func", imports: ["expvar"] })
extern class Func {

    @:native("String") function string(): String;
    @:native("Value") function value(): Dynamic;

}