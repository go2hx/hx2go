package go;

/**
    The unique package provides facilities for canonicalizing ("interning")
    comparable values.
**/
@:go.Type({ name: "unique", instanceName: "unique.unique", imports: ["unique"] })
extern class Unique {

    /**
        Make returns a globally unique handle for a value of type T. Handles
        are equal if and only if the values used to produce them are equal.
        Make is safe for concurrent use by multiple goroutines.
    **/
    @:native("Make") static function make<T: go.Comparable>(value: T): (go.unique.Handle<T>);

}