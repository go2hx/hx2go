package go.go.types;

/**
    TypeParamList holds a list of type parameters.
**/
@:structInit
@:go.Type({ name: "TypeParamList", instanceName: "types.TypeParamList", imports: ["go/types"] })
extern class TypeParamList {

    /**
        At returns the i'th type parameter in the list.
    **/
    @:native("At") function at(i: go.GoInt): (go.Pointer<go.go.types.TypeParam>);
    /**
        Len returns the number of type parameters in the list.
        It is safe to call on a nil receiver.
    **/
    @:native("Len") function len(): (go.GoInt);
    /**
        TypeParams returns a go1.23 iterator over a list of type parameters.
        
        Example: for tparam := range l.TypeParams() { ... }
    **/
    @:native("TypeParams") function typeParams(): (go.iter.Seq<go.Pointer<go.go.types.TypeParam>>);

}