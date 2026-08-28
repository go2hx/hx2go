package go.go.types;

/**
    A Var represents a declared variable (including function parameters and results, and struct fields).
**/
@:structInit
@:go.Type({ name: "Var", instanceName: "types.Var", imports: ["go/types"] })
extern class Var {

    /**
        Anonymous reports whether the variable is an embedded field.
        Same as Embedded; only present for backward-compatibility.
    **/
    @:native("Anonymous") function anonymous(): (Bool);
    /**
        Embedded reports whether the variable is an embedded field.
    **/
    @:native("Embedded") function embedded(): (Bool);
    /**
        Exported reports whether the object is exported (starts with a capital letter).
        It doesn't take into account whether the object is in a local (function) scope
        or not.
    **/
    @:native("Exported") function exported(): (Bool);
    /**
        Id is a wrapper for Id(obj.Pkg(), obj.Name()).
    **/
    @:native("Id") function id(): (std.String);
    /**
        IsField reports whether the variable is a struct field.
    **/
    @:native("IsField") function isField(): (Bool);
    /**
        Kind reports what kind of variable v is.
    **/
    @:native("Kind") function kind(): (go.go.types.VarKind);
    /**
        Name returns the object's (package-local, unqualified) name.
    **/
    @:native("Name") function name(): (std.String);
    /**
        Origin returns the canonical Var for its receiver, i.e. the Var object
        recorded in Info.Defs.
        
        For synthetic Vars created during instantiation (such as struct fields or
        function parameters that depend on type arguments), this will be the
        corresponding Var on the generic (uninstantiated) type. For all other Vars
        Origin returns the receiver.
    **/
    @:native("Origin") function origin(): (go.Pointer<go.go.types.Var>);
    /**
        Parent returns the scope in which the object is declared.
        The result is nil for methods and struct fields.
    **/
    @:native("Parent") function parent(): (go.Pointer<go.go.types.Scope>);
    /**
        Pkg returns the package to which the object belongs.
        The result is nil for labels and objects in the Universe scope.
    **/
    @:native("Pkg") function pkg(): (go.Pointer<go.go.types.Package>);
    /**
        Pos returns the declaration position of the object's identifier.
    **/
    @:native("Pos") function pos(): (go.go.token.Pos);
    /**
        SetKind sets the kind of the variable.
        It should be used only immediately after [NewVar] or [NewParam].
    **/
    @:native("SetKind") function setKind(kind: go.go.types.VarKind): Void;
    @:native("String") function string(): (std.String);
    /**
        Type returns the object's type.
    **/
    @:native("Type") function type(): (go.go.types.Type);

}