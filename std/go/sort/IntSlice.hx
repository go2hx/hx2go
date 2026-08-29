package go.sort;

/**
    IntSlice attaches the methods of Interface to []int, sorting in increasing order.
**/
@:go.Type({ name: "IntSlice", instanceName: "sort.IntSlice", imports: ["sort"] })
extern class IntSlice {

    @:native("Len") function len(): (go.GoInt);
    @:native("Less") function less(i: go.GoInt, j: go.GoInt): (Bool);
    /**
        Search returns the result of applying [SearchInts] to the receiver and x.
    **/
    @:native("Search") function search(x: go.GoInt): (go.GoInt);
    /**
        Sort is a convenience method: x.Sort() calls Sort(x).
    **/
    @:native("Sort") function sort(): Void;
    @:native("Swap") function swap(i: go.GoInt, j: go.GoInt): Void;

}