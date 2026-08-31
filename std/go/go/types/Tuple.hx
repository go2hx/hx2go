package go.go.types;

/**
    A Tuple represents an ordered list of variables; a nil *Tuple is a valid (empty) tuple.
    Tuples are used as components of signatures and to represent the type of multiple
    assignments; they are not first class types of Go.
**/
@:structInit
@:go.Type({ name: "Tuple", instanceName: "types.Tuple", imports: ["go/types"] })
extern class Tuple {

    /**
        At returns the i'th variable of tuple t.
    **/
    @:native("At") function at(i: go.GoInt): (go.Pointer<go.go.types.Var>);
    /**
        Len returns the number variables of tuple t.
    **/
    @:native("Len") function len(): (go.GoInt);
    @:native("String") function string(): (std.String);
    @:native("Underlying") function underlying(): (go.go.types.Type);
    /**
        Variables returns a go1.23 iterator over the variables of a tuple type.
        
        Example: for v := range tuple.Variables() { ... }
    **/
    @:native("Variables") function variables(): (go.iter.Seq<go.Pointer<go.go.types.Var>>);

}