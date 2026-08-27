package go.go;

@:structInit
@:go.Type({ name: "parser", instanceName: "parser.parser", imports: ["go/parser"] })
extern class Parser {

    @:native("AllErrors") static var allErrors: go.go.parser.Mode;
    @:native("DeclarationErrors") static var declarationErrors: go.go.parser.Mode;
    @:native("ImportsOnly") static var importsOnly: go.go.parser.Mode;
    @:native("PackageClauseOnly") static var packageClauseOnly: go.go.parser.Mode;
    @:native("ParseComments") static var parseComments: go.go.parser.Mode;
    @:native("SkipObjectResolution") static var skipObjectResolution: go.go.parser.Mode;
    @:native("SpuriousErrors") static var spuriousErrors: go.go.parser.Mode;
    @:native("Trace") static var trace: go.go.parser.Mode;

    @:native("ParseDir") static function parseDir(fset: go.Pointer<go.go.token.FileSet>, path: String, filter: (p0: go.io.fs.FileInfo) -> (Bool), mode: go.go.parser.Mode): (go.Result<go.Map<String, go.Pointer<go.go.ast.Package>>>);
    @:native("ParseExpr") static function parseExpr(x: String): (go.Result<go.go.ast.Expr>);
    @:native("ParseExprFrom") static function parseExprFrom(fset: go.Pointer<go.go.token.FileSet>, filename: String, src: Dynamic, mode: go.go.parser.Mode): (go.Result<go.go.ast.Expr>);
    @:native("ParseFile") static function parseFile(fset: go.Pointer<go.go.token.FileSet>, filename: String, src: Dynamic, mode: go.go.parser.Mode): (go.Result<go.Pointer<go.go.ast.File>>);

}