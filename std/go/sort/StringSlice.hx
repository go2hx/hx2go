package go.sort;

/**
    StringSlice attaches the methods of Interface to []string, sorting in increasing order.
**/
@:go.Type({ name: "StringSlice", instanceName: "sort.StringSlice", imports: ["sort"] })
extern class StringSlice {

    @:native("Len") function len(): (go.GoInt);
    @:native("Less") function less(i: go.GoInt, j: go.GoInt): (Bool);
    /**
        Search returns the result of applying [SearchStrings] to the receiver and x.
    **/
    @:native("Search") function search(x: String): (go.GoInt);
    /**
        Sort is a convenience method: x.Sort() calls Sort(x).
    **/
    @:native("Sort") function sort(): Void;
    @:native("Swap") function swap(i: go.GoInt, j: go.GoInt): Void;

}