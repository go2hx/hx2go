package go.go.types;

/**
    A MethodSet is an ordered set of concrete or abstract (interface) methods;
    a method is a [MethodVal] selection, and they are ordered by ascending m.Obj().Id().
    The zero value for a MethodSet is a ready-to-use empty method set.
**/
@:structInit
@:go.Type({ name: "MethodSet", instanceName: "types.MethodSet", imports: ["go/types"] })
extern class MethodSet {

    /**
        At returns the i'th method in s for 0 <= i < s.Len().
    **/
    @:native("At") function at(i: go.GoInt): (go.Pointer<go.go.types.Selection>);
    /**
        Len returns the number of methods in s.
    **/
    @:native("Len") function len(): (go.GoInt);
    /**
        Lookup returns the method with matching package and name, or nil if not found.
    **/
    @:native("Lookup") function lookup(pkg: go.Pointer<go.go.types.Package>, name: std.String): (go.Pointer<go.go.types.Selection>);
    /**
        Methods returns a go1.23 iterator over the methods of a method set.
        
        Example: for method := range s.Methods() { ... }
    **/
    @:native("Methods") function methods(): (go.iter.Seq<go.Pointer<go.go.types.Selection>>);
    @:native("String") function string(): (std.String);

}