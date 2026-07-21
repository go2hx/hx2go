package go.sort;

@:go.Type({ name: "Float64Slice", instanceName: "sort.Float64Slice", imports: ["sort"] })
extern class Float64Slice {

    @:native("Len") function len(): (go.GoInt);
    @:native("Less") function less(i: go.GoInt, j: go.GoInt): (Bool);
    @:native("Search") function search(x: Float): (go.GoInt);
    @:native("Sort") function sort(): Void;
    @:native("Swap") function swap(i: go.GoInt, j: go.GoInt): Void;

}