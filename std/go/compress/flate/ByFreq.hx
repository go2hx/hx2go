package go.compress.flate;

@:go.Type({ name: "byFreq", instanceName: "flate.byFreq", imports: ["compress/flate"] })
extern class ByFreq {

    @:native("Len") function len(): (go.GoInt);
    @:native("Less") function less(i: go.GoInt, j: go.GoInt): (Bool);
    @:native("Swap") function swap(i: go.GoInt, j: go.GoInt): Void;

}