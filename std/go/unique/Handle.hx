package go.unique;

/**
    Handle is a globally unique identity for some value of type T.
    
    Two handles compare equal exactly if the two values used to create the handles
    would have also compared equal. The comparison of two handles is trivial and
    typically much more efficient than comparing the values used to create them.
**/
@:structInit
@:go.Type({ name: "Handle", instanceName: "unique.Handle", imports: ["unique"] })
extern class Handle<T: go.Comparable> {

    /**
        Value returns a shallow copy of the T value that produced the Handle.
        Value is safe for concurrent use by multiple goroutines.
    **/
    @:native("Value") function value(): (T);

}