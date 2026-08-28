package go.expvar;

@:structInit
@:go.Type({ name: "KeyValue", instanceName: "expvar.KeyValue", imports: ["expvar"] })
extern class KeyValue {

    @:native("Key") var key: std.String;
    @:native("Value") var value: go.expvar.Var;

    function new(key: std.String="", value: go.expvar.Var=null);

}