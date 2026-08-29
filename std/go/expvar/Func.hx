package go.expvar;

/**
    Func implements [Var] by calling the function
    and formatting the returned value using JSON.
**/
@:go.Type({ name: "Func", instanceName: "expvar.Func", imports: ["expvar"] })
extern class Func {

    @:native("String") function string(): (std.String);
    @:native("Value") function value(): (Dynamic);

}