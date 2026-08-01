package go.runtime.pprof;

@:structInit
@:go.Type({ name: "runtimeProfile", instanceName: "pprof.runtimeProfile", imports: ["runtime/pprof"] })
extern class RuntimeProfile {

    @:native("Label") function label(i: go.GoInt): (go.Pointer<go.runtime.pprof.LabelMap>);
    @:native("Len") function len(): (go.GoInt);
    @:native("Stack") function stack(i: go.GoInt): (go.Slice<go.UIntPtr>);

}