package go.compress.flate;

@:go.Type({ name: "byLiteral", instanceName: "flate.byLiteral", imports: ["compress/flate"] })
extern class ByLiteral {

    @:native("Len") function len(): (go.GoInt);
    @:native("Less") function less(i: go.GoInt, j: go.GoInt): (Bool);
    @:native("Swap") function swap(i: go.GoInt, j: go.GoInt): Void;

}