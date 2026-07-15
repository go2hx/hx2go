package go.sort;

@:go.Type({ name: "IntSlice", instanceName: "sort.IntSlice", imports: ["sort"] })
extern class IntSlice {

    @:native("Len") function len(): go.GoInt;
    @:native("Less") function less(i: go.GoInt, j: go.GoInt): Bool;
    @:native("Search") function search(x: go.GoInt): go.GoInt;
    @:native("Sort") function sort(): Void;
    @:native("Swap") function swap(i: go.GoInt, j: go.GoInt): Void;

}