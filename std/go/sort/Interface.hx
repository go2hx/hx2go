package go.sort;

/**
    An implementation of Interface can be sorted by the routines in this package.
    The methods refer to elements of the underlying collection by integer index.
**/
@:go.Type({ name: "Interface", instanceName: "sort.Interface", imports: ["sort"] })
extern typedef Interface = {

    @:native("Len") function len(): (go.GoInt);
    @:native("Less") function less(i: go.GoInt, j: go.GoInt): (Bool);
    @:native("Swap") function swap(i: go.GoInt, j: go.GoInt): Void;

}