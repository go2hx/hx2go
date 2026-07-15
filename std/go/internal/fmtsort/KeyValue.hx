package go.internal.fmtsort;

@:structInit
@:go.Type({ name: "KeyValue", instanceName: "fmtsort.KeyValue", imports: ["internal/fmtsort"] })
extern class KeyValue {

    @:native("Key") var key: go.reflect.Value;
    @:native("Value") var value: go.reflect.Value;

function new(key: go.reflect.Value, value: go.reflect.Value);

}