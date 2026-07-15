package go.internal.runtime.pprof.label;

@:structInit
@:go.Type({ name: "Set", instanceName: "label.Set", imports: ["internal/runtime/pprof/label"] })
extern class Set {

    @:native("List") var list: go.Slice<go.internal.runtime.pprof.label.Label>;

function new(list: go.Slice<go.internal.runtime.pprof.label.Label>);

}