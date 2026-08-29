package go.go.types;

/**
    A Package describes a Go package.
**/
@:structInit
@:go.Type({ name: "Package", instanceName: "types.Package", imports: ["go/types"] })
extern class Package {

    /**
        A package is complete if its scope contains (at least) all
        exported objects; otherwise it is incomplete.
    **/
    @:native("Complete") function complete(): (Bool);
    /**
        GoVersion returns the minimum Go version required by this package.
        If the minimum version is unknown, GoVersion returns the empty string.
        Individual source files may specify a different minimum Go version,
        as reported in the [go/ast.File.GoVersion] field.
    **/
    @:native("GoVersion") function goVersion(): (std.String);
    /**
        Imports returns the list of packages directly imported by
        pkg; the list is in source order.
        
        If pkg was loaded from export data, Imports includes packages that
        provide package-level objects referenced by pkg. This may be more or
        less than the set of packages directly imported by pkg's source code.
        
        If pkg uses cgo and the FakeImportC configuration option
        was enabled, the imports list may contain a fake "C" package.
    **/
    @:native("Imports") function imports(): (go.Slice<go.Pointer<go.go.types.Package>>);
    /**
        MarkComplete marks a package as complete.
    **/
    @:native("MarkComplete") function markComplete(): Void;
    /**
        Name returns the package name.
    **/
    @:native("Name") function name(): (std.String);
    /**
        Path returns the package path.
    **/
    @:native("Path") function path(): (std.String);
    /**
        Scope returns the (complete or incomplete) package scope
        holding the objects declared at package level (TypeNames,
        Consts, Vars, and Funcs).
        For a nil pkg receiver, Scope returns the Universe scope.
    **/
    @:native("Scope") function scope(): (go.Pointer<go.go.types.Scope>);
    /**
        SetImports sets the list of explicitly imported packages to list.
        It is the caller's responsibility to make sure list elements are unique.
    **/
    @:native("SetImports") function setImports(list: go.Slice<go.Pointer<go.go.types.Package>>): Void;
    /**
        SetName sets the package name.
    **/
    @:native("SetName") function setName(name: std.String): Void;
    @:native("String") function string(): (std.String);

}