package go.go.types;

/**
    A TypeParam represents the type of a type parameter in a generic declaration.
    
    A TypeParam has a name; use the [TypeParam.Obj] method to access
    its [TypeName] object.
**/
@:structInit
@:go.Type({ name: "TypeParam", instanceName: "types.TypeParam", imports: ["go/types"] })
extern class TypeParam {

    /**
        Constraint returns the type constraint specified for t.
    **/
    @:native("Constraint") function constraint(): (go.go.types.Type);
    /**
        Index returns the index of the type param within its param list, or -1 if
        the type parameter has not yet been bound to a type.
    **/
    @:native("Index") function index(): (go.GoInt);
    /**
        Obj returns the type name for the type parameter t.
    **/
    @:native("Obj") function obj(): (go.Pointer<go.go.types.TypeName>);
    /**
        SetConstraint sets the type constraint for t.
        
        It must be called by users of NewTypeParam after the bound's underlying is
        fully defined, and before using the type parameter in any way other than to
        form other types. Once SetConstraint returns the receiver, t is safe for
        concurrent use.
    **/
    @:native("SetConstraint") function setConstraint(bound: go.go.types.Type): Void;
    @:native("String") function string(): (std.String);
    /**
        Underlying returns the [underlying type] of the type parameter t, which is
        the underlying type of its constraint. This type is always an interface.
        
        [underlying type]: https://go.dev/ref/spec#Underlying_types.
    **/
    @:native("Underlying") function underlying(): (go.go.types.Type);

}