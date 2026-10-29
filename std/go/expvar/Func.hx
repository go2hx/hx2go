package go.expvar;

/**
    Func implements [Var] by calling the function
    and formatting the returned value using JSON.
**/
@:go.Type({ name: "Func", instanceName: "expvar.Func", imports: ["expvar"] })
extern typedef Func = haxe.extern.EitherType<() -> (Dynamic), {
    @:native("String") function string(): (std.String);
    @:native("Value") function value(): (Dynamic);

}>