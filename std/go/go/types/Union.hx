package go.go.types;

/**
    A Union represents a union of terms embedded in an interface.
**/
@:structInit
@:go.Type({ name: "Union", instanceName: "types.Union", imports: ["go/types"] })
extern class Union {

    @:native("Len") function len(): (go.GoInt);
    @:native("String") function string(): (std.String);
    @:native("Term") function term(i: go.GoInt): (go.Pointer<go.go.types.Term>);
    /**
        Terms returns a go1.23 iterator over the terms of a union.
        
        Example: for term := range union.Terms() { ... }
    **/
    @:native("Terms") function terms(): (go.iter.Seq<go.Pointer<go.go.types.Term>>);
    @:native("Underlying") function underlying(): (go.go.types.Type);

}