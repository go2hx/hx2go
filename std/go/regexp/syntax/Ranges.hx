package go.regexp.syntax;

@:structInit
@:go.Type({ name: "ranges", instanceName: "syntax.ranges", imports: ["regexp/syntax"] })
extern class Ranges {

    @:native("Len") function len(): (go.GoInt);
    @:native("Less") function less(i: go.GoInt, j: go.GoInt): (Bool);
    @:native("Swap") function swap(i: go.GoInt, j: go.GoInt): Void;

}