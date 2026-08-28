package go.go.types;

/**
    An Interface represents an interface type.
**/
@:structInit
@:go.Type({ name: "Interface", instanceName: "types.Interface", imports: ["go/types"] })
extern class Interface {

    /**
        Complete computes the interface's type set. It must be called by users of
        [NewInterfaceType] and [NewInterface] after the interface's embedded types are
        fully defined and before using the interface type in any way other than to
        form other types. The interface must not contain duplicate methods or a
        panic occurs. Complete returns the receiver.
        
        Interface types that have been completed are safe for concurrent use.
    **/
    @:native("Complete") function complete(): (go.Pointer<go.go.types.Interface>);
    /**
        Embedded returns the i'th embedded defined (*[Named]) type of interface t for 0 <= i < t.NumEmbeddeds().
        The result is nil if the i'th embedded type is not a defined type.
        
        Deprecated: Use [Interface.EmbeddedType] which is not restricted to defined (*[Named]) types.
    **/
    @:native("Embedded") function embedded(i: go.GoInt): (go.Pointer<go.go.types.Named>);
    /**
        EmbeddedType returns the i'th embedded type of interface t for 0 <= i < t.NumEmbeddeds().
    **/
    @:native("EmbeddedType") function embeddedType(i: go.GoInt): (go.go.types.Type);
    /**
        EmbeddedTypes returns a go1.23 iterator over the types embedded within an interface.
        
        Example: for e := range t.EmbeddedTypes() { ... }
    **/
    @:native("EmbeddedTypes") function embeddedTypes(): (go.iter.Seq<go.go.types.Type>);
    /**
        Empty reports whether t is the empty interface.
    **/
    @:native("Empty") function empty(): (Bool);
    /**
        ExplicitMethod returns the i'th explicitly declared method of interface t for 0 <= i < t.NumExplicitMethods().
        The methods are ordered by their unique [Id].
    **/
    @:native("ExplicitMethod") function explicitMethod(i: go.GoInt): (go.Pointer<go.go.types.Func>);
    /**
        ExplicitMethods returns a go1.23 iterator over the explicit methods of
        an interface, ordered by Id.
        
        Example: for m := range t.ExplicitMethods() { ... }
    **/
    @:native("ExplicitMethods") function explicitMethods(): (go.iter.Seq<go.Pointer<go.go.types.Func>>);
    /**
        IsComparable reports whether each type in interface t's type set is comparable.
    **/
    @:native("IsComparable") function isComparable(): (Bool);
    /**
        IsImplicit reports whether the interface t is a wrapper for a type set literal.
    **/
    @:native("IsImplicit") function isImplicit(): (Bool);
    /**
        IsMethodSet reports whether the interface t is fully described by its method
        set.
    **/
    @:native("IsMethodSet") function isMethodSet(): (Bool);
    /**
        MarkImplicit marks the interface t as implicit, meaning this interface
        corresponds to a constraint literal such as ~T or A|B without explicit
        interface embedding. MarkImplicit should be called before any concurrent use
        of implicit interfaces.
    **/
    @:native("MarkImplicit") function markImplicit(): Void;
    /**
        Method returns the i'th method of interface t for 0 <= i < t.NumMethods().
        The methods are ordered by their unique Id.
    **/
    @:native("Method") function method(i: go.GoInt): (go.Pointer<go.go.types.Func>);
    /**
        Methods returns a go1.23 iterator over all the methods of an
        interface, ordered by Id.
        
        Example: for m := range t.Methods() { ... }
    **/
    @:native("Methods") function methods(): (go.iter.Seq<go.Pointer<go.go.types.Func>>);
    /**
        NumEmbeddeds returns the number of embedded types in interface t.
    **/
    @:native("NumEmbeddeds") function numEmbeddeds(): (go.GoInt);
    /**
        NumExplicitMethods returns the number of explicitly declared methods of interface t.
    **/
    @:native("NumExplicitMethods") function numExplicitMethods(): (go.GoInt);
    /**
        NumMethods returns the total number of methods of interface t.
    **/
    @:native("NumMethods") function numMethods(): (go.GoInt);
    @:native("String") function string(): (std.String);
    @:native("Underlying") function underlying(): (go.go.types.Type);

}