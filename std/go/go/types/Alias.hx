package go.go.types;

/**
    An Alias represents an alias type.
    
    Alias types are created by alias declarations such as:
    
    	type A = int
    
    The type on the right-hand side of the declaration can be accessed
    using [Alias.Rhs]. This type may itself be an alias.
    Call [Unalias] to obtain the first non-alias type in a chain of
    alias type declarations.
    
    Like a defined ([Named]) type, an alias type has a name.
    Use the [Alias.Obj] method to access its [TypeName] object.
    
    Historically, Alias types were not materialized so that, in the example
    above, A's type was represented by a Basic (int), not an Alias
    whose [Alias.Rhs] is int. But Go 1.24 allows you to declare an
    alias type with type parameters or arguments:
    
    	type Set[K comparable] = map[K]bool
    	s := make(Set[String])
    
    and this requires that Alias types be materialized. Use the
    [Alias.TypeParams] and [Alias.TypeArgs] methods to access them.
    
    To ease the transition, the Alias type was introduced in go1.22,
    but the type-checker would not construct values of this type unless
    the GODEBUG=gotypesalias=1 environment variable was provided.
    Starting in go1.23, this variable is enabled by default.
    This setting also causes the predeclared type "any" to be
    represented as an Alias, not a bare [Interface].
**/
@:structInit
@:go.Type({ name: "Alias", instanceName: "types.Alias", imports: ["go/types"] })
extern class Alias {

    /**
        Obj returns the type name for the declaration defining the alias type a.
        For instantiated types, this is same as the type name of the origin type.
    **/
    @:native("Obj") function obj(): (go.Pointer<go.go.types.TypeName>);
    /**
        Origin returns the generic Alias type of which a is an instance.
        If a is not an instance of a generic alias, Origin returns a.
    **/
    @:native("Origin") function origin(): (go.Pointer<go.go.types.Alias>);
    /**
        Rhs returns the type R on the right-hand side of an alias
        declaration "type A = R", which may be another alias.
    **/
    @:native("Rhs") function rhs(): (go.go.types.Type);
    /**
        SetTypeParams sets the type parameters of the alias type a.
        The alias a must not have type arguments.
    **/
    @:native("SetTypeParams") function setTypeParams(tparams: go.Slice<go.Pointer<go.go.types.TypeParam>>): Void;
    @:native("String") function string(): (std.String);
    /**
        TypeArgs returns the type arguments used to instantiate the Alias type.
        If a is not an instance of a generic alias, the result is nil.
    **/
    @:native("TypeArgs") function typeArgs(): (go.Pointer<go.go.types.TypeList>);
    /**
        TypeParams returns the type parameters of the alias type a, or nil.
        A generic Alias and its instances have the same type parameters.
    **/
    @:native("TypeParams") function typeParams(): (go.Pointer<go.go.types.TypeParamList>);
    /**
        Underlying returns the [underlying type] of the alias type a, which is the
        underlying type of the aliased type. Underlying types are never Named,
        TypeParam, or Alias types.
        
        [underlying type]: https://go.dev/ref/spec#Underlying_types.
    **/
    @:native("Underlying") function underlying(): (go.go.types.Type);

}