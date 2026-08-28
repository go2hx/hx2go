package go.go.types;

/**
    Info holds result type information for a type-checked package.
    Only the information for which a map is provided is collected.
    If the package has type errors, the collected information may
    be incomplete.
**/
@:structInit
@:go.Type({ name: "Info", instanceName: "types.Info", imports: ["go/types"] })
extern class Info {

    @:native("Types") var types: go.Map<go.go.ast.Expr, go.go.types.TypeAndValue>;
    @:native("Instances") var instances: go.Map<go.Pointer<go.go.ast.Ident>, go.go.types.Instance>;
    @:native("Defs") var defs: go.Map<go.Pointer<go.go.ast.Ident>, go.go.types.Object>;
    @:native("Uses") var uses: go.Map<go.Pointer<go.go.ast.Ident>, go.go.types.Object>;
    @:native("Implicits") var implicits: go.Map<go.go.ast.Node, go.go.types.Object>;
    @:native("Selections") var selections: go.Map<go.Pointer<go.go.ast.SelectorExpr>, go.Pointer<go.go.types.Selection>>;
    @:native("Scopes") var scopes: go.Map<go.go.ast.Node, go.Pointer<go.go.types.Scope>>;
    @:native("InitOrder") var initOrder: go.Slice<go.Pointer<go.go.types.Initializer>>;
    @:native("FileVersions") var fileVersions: go.Map<go.Pointer<go.go.ast.File>, std.String>;

    function new(types: go.Map<go.go.ast.Expr, go.go.types.TypeAndValue>=null, instances: go.Map<go.Pointer<go.go.ast.Ident>, go.go.types.Instance>=null, defs: go.Map<go.Pointer<go.go.ast.Ident>, go.go.types.Object>=null, uses: go.Map<go.Pointer<go.go.ast.Ident>, go.go.types.Object>=null, implicits: go.Map<go.go.ast.Node, go.go.types.Object>=null, selections: go.Map<go.Pointer<go.go.ast.SelectorExpr>, go.Pointer<go.go.types.Selection>>=null, scopes: go.Map<go.go.ast.Node, go.Pointer<go.go.types.Scope>>=null, initOrder: go.Slice<go.Pointer<go.go.types.Initializer>>=null, fileVersions: go.Map<go.Pointer<go.go.ast.File>, std.String>=null);

    /**
        ObjectOf returns the object denoted by the specified id,
        or nil if not found.
        
        If id is an embedded struct field, [Info.ObjectOf] returns the field (*[Var])
        it defines, not the type (*[TypeName]) it uses.
        
        Precondition: the Uses and Defs maps are populated.
    **/
    @:native("ObjectOf") function objectOf(id: go.Pointer<go.go.ast.Ident>): (go.go.types.Object);
    /**
        PkgNameOf returns the local package name defined by the import,
        or nil if not found.
        
        For dot-imports, the package name is ".".
        
        Precondition: the Defs and Implicts maps are populated.
    **/
    @:native("PkgNameOf") function pkgNameOf(imp: go.Pointer<go.go.ast.ImportSpec>): (go.Pointer<go.go.types.PkgName>);
    /**
        TypeOf returns the type of expression e, or nil if not found.
        Precondition: the Types, Uses and Defs maps are populated.
    **/
    @:native("TypeOf") function typeOf(e: go.go.ast.Expr): (go.go.types.Type);

}