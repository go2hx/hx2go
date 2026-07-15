package go.expvar;

@:go.Type({ name: "Var", instanceName: "expvar.Var", imports: ["expvar"] })
extern typedef Var = {

    @:native("String") function string(): String;

}