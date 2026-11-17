package go.go.types;

/**
    A Named represents a named (defined) type.
    
    A declaration such as:
    
    	type S struct { ... }
    
    creates a defined type whose underlying type is a struct,
    and binds this type to the object S, a [TypeName].
    Use [Named.Underlying] to access the underlying type.
    Use [Named.Obj] to obtain the object S.
    
    Before type aliases (Go 1.9), the spec called defined types "named types".
**/
@:structInit
@:go.Type({ name: "Named", instanceName: "types.Named", imports: ["go/types"] })
extern class Named {

    /**
        AddMethod adds method m unless it is already in the method list.
        The method must be in the same package as t, and t must not have
        type arguments.
    **/
    @:native("AddMethod") function addMethod(m: go.Pointer<go.go.types.Func>): Void;
    /**
        Method returns the i'th method of named type t for 0 <= i < t.NumMethods().
        
        For an ordinary or instantiated type t, the receiver base type of this
        method is the named type t. For an uninstantiated generic type t, each
        method receiver is instantiated with its receiver type parameters.
        
        Methods are numbered deterministically: given the same list of source files
        presented to the type checker, or the same sequence of NewMethod and AddMethod
        calls, the mapping from method index to corresponding method remains the same.
        But the specific ordering is not specified and must not be relied on as it may
        change in the future.
    **/
    @:native("Method") function method(i: go.GoInt): (go.Pointer<go.go.types.Func>);
    /**
        Methods returns a go1.23 iterator over the declared methods of a named type.
        
        Example: for m := range t.Methods() { ... }
    **/
    @:native("Methods") function methods(): (go.iter.Seq<go.Pointer<go.go.types.Func>>);
    /**
        NumMethods returns the number of explicit methods defined for t.
    **/
    @:native("NumMethods") function numMethods(): (go.GoInt);
    /**
        Obj returns the type name for the declaration defining the named type t. For
        instantiated types, this is same as the type name of the origin type.
    **/
    @:native("Obj") function obj(): (go.Pointer<go.go.types.TypeName>);
    /**
        Origin returns the generic type from which the named type t is
        instantiated. If t is not an instantiated type, the result is t.
    **/
    @:native("Origin") function origin(): (go.Pointer<go.go.types.Named>);
    /**
        SetTypeParams sets the type parameters of the named type t.
        t must not have type arguments.
    **/
    @:native("SetTypeParams") function setTypeParams(tparams: go.Slice<go.Pointer<go.go.types.TypeParam>>): Void;
    /**
        SetUnderlying sets the underlying type and marks t as complete.
        t must not have type arguments.
    **/
    @:native("SetUnderlying") function setUnderlying(u: go.go.types.Type): Void;
    @:native("String") function string(): (std.String);
    /**
        TypeArgs returns the type arguments used to instantiate the named type t.
    **/
    @:native("TypeArgs") function typeArgs(): (go.Pointer<go.go.types.TypeList>);
    /**
        TypeParams returns the type parameters of the named type t, or nil.
        The result is non-nil for an (originally) generic type even if it is instantiated.
    **/
    @:native("TypeParams") function typeParams(): (go.Pointer<go.go.types.TypeParamList>);
    /**
        Underlying returns the [underlying type] of the named type t, resolving all
        forwarding declarations. Underlying types are never Named, TypeParam, or
        Alias types.
        
        [underlying type]: https://go.dev/ref/spec#Underlying_types.
    **/
    @:native("Underlying") function underlying(): (go.go.types.Type);

}