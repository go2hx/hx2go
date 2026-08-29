package go.go.types;

/**
    A Label represents a declared label.
    Labels don't have a type.
**/
@:structInit
@:go.Type({ name: "Label", instanceName: "types.Label", imports: ["go/types"] })
extern class Label {

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
        Name returns the object's (package-local, unqualified) name.
    **/
    @:native("Name") function name(): (std.String);
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
    @:native("String") function string(): (std.String);
    /**
        Type returns the object's type.
    **/
    @:native("Type") function type(): (go.go.types.Type);

}