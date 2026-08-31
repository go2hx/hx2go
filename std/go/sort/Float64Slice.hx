package go.sort;

/**
    Float64Slice implements Interface for a []float64, sorting in increasing order,
    with not-a-number (NaN) values ordered before other values.
**/
@:go.Type({ name: "Float64Slice", instanceName: "sort.Float64Slice", imports: ["sort"] })
extern class Float64Slice {

    @:native("Len") function len(): (go.GoInt);
    /**
        Less reports whether x[i] should be ordered before x[j], as required by the sort Interface.
        Note that floating-point comparison by itself is not a transitive relation: it does not
        report a consistent ordering for not-a-number (NaN) values.
        This implementation of Less places NaN values before any others, by using:
        
        	x[i] < x[j] || (math.IsNaN(x[i]) && !math.IsNaN(x[j]))
    **/
    @:native("Less") function less(i: go.GoInt, j: go.GoInt): (Bool);
    /**
        Search returns the result of applying [SearchFloat64s] to the receiver and x.
    **/
    @:native("Search") function search(x: Float): (go.GoInt);
    /**
        Sort is a convenience method: x.Sort() calls Sort(x).
    **/
    @:native("Sort") function sort(): Void;
    @:native("Swap") function swap(i: go.GoInt, j: go.GoInt): Void;

}