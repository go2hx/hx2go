package go.internal.runtime.pprof;

@:go.Type({ name: "label", instanceName: "label.label", imports: ["internal/runtime/pprof/label"] })
extern class Label {

    @:native("NewSet") static function newSet(list: go.Slice<go.internal.runtime.pprof.label.Label>): go.internal.runtime.pprof.label.Set;

}