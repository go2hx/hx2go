package go.go.types;

/**
    TypeList holds a list of types.
**/
@:structInit
@:go.Type({ name: "TypeList", instanceName: "types.TypeList", imports: ["go/types"] })
extern class TypeList {

    /**
        At returns the i'th type in the list.
    **/
    @:native("At") function at(i: go.GoInt): (go.go.types.Type);
    /**
        Len returns the number of types in the list.
        It is safe to call on a nil receiver.
    **/
    @:native("Len") function len(): (go.GoInt);
    /**
        Types returns a go1.23 iterator over the elements of a list of types.
        
        Example: for t := range l.Types() { ... }
    **/
    @:native("Types") function types(): (go.iter.Seq<go.go.types.Type>);

}