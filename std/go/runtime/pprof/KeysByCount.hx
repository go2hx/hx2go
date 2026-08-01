package go.runtime.pprof;

@:structInit
@:go.Type({ name: "keysByCount", instanceName: "pprof.keysByCount", imports: ["runtime/pprof"] })
extern class KeysByCount {

    @:native("Len") function len(): (go.GoInt);
    @:native("Less") function less(i: go.GoInt, j: go.GoInt): (Bool);
    @:native("Swap") function swap(i: go.GoInt, j: go.GoInt): Void;

}