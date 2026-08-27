package go.go.types;

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
    @:native("FileVersions") var fileVersions: go.Map<go.Pointer<go.go.ast.File>, String>;

    function new(types: go.Map<go.go.ast.Expr, go.go.types.TypeAndValue>=null, instances: go.Map<go.Pointer<go.go.ast.Ident>, go.go.types.Instance>=null, defs: go.Map<go.Pointer<go.go.ast.Ident>, go.go.types.Object>=null, uses: go.Map<go.Pointer<go.go.ast.Ident>, go.go.types.Object>=null, implicits: go.Map<go.go.ast.Node, go.go.types.Object>=null, selections: go.Map<go.Pointer<go.go.ast.SelectorExpr>, go.Pointer<go.go.types.Selection>>=null, scopes: go.Map<go.go.ast.Node, go.Pointer<go.go.types.Scope>>=null, initOrder: go.Slice<go.Pointer<go.go.types.Initializer>>=null, fileVersions: go.Map<go.Pointer<go.go.ast.File>, String>=null);

    @:native("ObjectOf") function objectOf(id: go.Pointer<go.go.ast.Ident>): (go.go.types.Object);
    @:native("PkgNameOf") function pkgNameOf(imp: go.Pointer<go.go.ast.ImportSpec>): (go.Pointer<go.go.types.PkgName>);
    @:native("TypeOf") function typeOf(e: go.go.ast.Expr): (go.go.types.Type);

}