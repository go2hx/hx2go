package go.sort;

@:go.Type({ name: "StringSlice", instanceName: "sort.StringSlice", imports: ["sort"] })
extern class StringSlice {

    @:native("Len") function len(): go.GoInt;
    @:native("Less") function less(i: go.GoInt, j: go.GoInt): Bool;
    @:native("Search") function search(x: String): go.GoInt;
    @:native("Sort") function sort(): Void;
    @:native("Swap") function swap(i: go.GoInt, j: go.GoInt): Void;

}