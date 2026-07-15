package go.internal.runtime.pprof.label;

@:structInit
@:go.Type({ name: "Label", instanceName: "label.Label", imports: ["internal/runtime/pprof/label"] })
extern class Label {

    @:native("Key") var key: String;
    @:native("Value") var value: String;

function new(key: String, value: String);

}