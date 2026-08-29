package go.go.types;

/**
    A Func represents a declared function, concrete method, or abstract
    (interface) method. Its Type() is always a *Signature.
    An abstract method may belong to many interfaces due to embedding.
**/
@:structInit
@:go.Type({ name: "Func", instanceName: "types.Func", imports: ["go/types"] })
extern class Func {

    /**
        Exported reports whether the object is exported (starts with a capital letter).
        It doesn't take into account whether the object is in a local (function) scope
        or not.
    **/
    @:native("Exported") function exported(): (Bool);
    /**
        FullName returns the package- or receiver-type-qualified name of
        function or method obj.
    **/
    @:native("FullName") function fullName(): (std.String);
    /**
        Id is a wrapper for Id(obj.Pkg(), obj.Name()).
    **/
    @:native("Id") function id(): (std.String);
    /**
        Name returns the object's (package-local, unqualified) name.
    **/
    @:native("Name") function name(): (std.String);
    /**
        Origin returns the canonical Func for its receiver, i.e. the Func object
        recorded in Info.Defs.
        
        For synthetic functions created during instantiation (such as methods on an
        instantiated Named type or interface methods that depend on type arguments),
        this will be the corresponding Func on the generic (uninstantiated) type.
        For all other Funcs Origin returns the receiver.
    **/
    @:native("Origin") function origin(): (go.Pointer<go.go.types.Func>);
    /**
        Parent returns the scope in which the object is declared.
        The result is nil for methods and struct fields.
    **/
    @:native("Parent") function parent(): (go.Pointer<go.go.types.Scope>);
    /**
        Pkg returns the package to which the function belongs.
        
        The result is nil for methods of types in the Universe scope,
        like method Error of the error built-in interface type.
    **/
    @:native("Pkg") function pkg(): (go.Pointer<go.go.types.Package>);
    /**
        Pos returns the declaration position of the object's identifier.
    **/
    @:native("Pos") function pos(): (go.go.token.Pos);
    /**
        Scope returns the scope of the function's body block.
        The result is nil for imported or instantiated functions and methods
        (but there is also no mechanism to get to an instantiated function).
    **/
    @:native("Scope") function scope(): (go.Pointer<go.go.types.Scope>);
    /**
        Signature returns the signature (type) of the function or method.
    **/
    @:native("Signature") function signature(): (go.Pointer<go.go.types.Signature>);
    @:native("String") function string(): (std.String);
    /**
        Type returns the object's type.
    **/
    @:native("Type") function type(): (go.go.types.Type);

}