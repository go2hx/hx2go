package go.runtime.pprof;

@:structInit
@:go.Type({ name: "labelMap", instanceName: "pprof.labelMap", imports: ["runtime/pprof"] })
extern class LabelMap {

    @:native("Set") var set: Dynamic;
    @:native("List") var list: go.Slice<Dynamic>;

    function new(set: Dynamic);

    @:native("String") function string(): (String);

}