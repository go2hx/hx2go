package go.container.heap;

/**
    The Interface type describes the requirements
    for a type using the routines in this package.
    Any type that implements it may be used as a
    min-heap with the following invariants (established after
    [Init] has been called or if the data is empty or sorted):
    
    	!h.Less(j, i) for 0 <= i < h.Len() and 2*i+1 <= j <= 2*i+2 and j < h.Len()
    
    Note that [Push] and [Pop] in this interface are for package heap's
    implementation to call. To add and remove things from the heap,
    use [heap.Push] and [heap.Pop].
**/
@:go.Type({ name: "Interface", instanceName: "heap.Interface", imports: ["container/heap"] })
extern typedef Interface = {

    @:native("Len") function len(): (go.GoInt);
    @:native("Less") function less(i: go.GoInt, j: go.GoInt): (Bool);
    @:native("Pop") function pop(): (Dynamic);
    @:native("Push") function push(x: Dynamic): Void;
    @:native("Swap") function swap(i: go.GoInt, j: go.GoInt): Void;

}