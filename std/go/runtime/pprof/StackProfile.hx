package go.runtime.pprof;

@:go.Type({ name: "stackProfile", instanceName: "pprof.stackProfile", imports: ["runtime/pprof"] })
extern class StackProfile {

    @:native("Label") function label(i: go.GoInt): (go.Pointer<go.runtime.pprof.LabelMap>);
    @:native("Len") function len(): (go.GoInt);
    @:native("Stack") function stack(i: go.GoInt): (go.Slice<go.UIntPtr>);

}