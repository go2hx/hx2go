package go.go;

@:structInit
@:go.Type({ name: "parser", instanceName: "parser.parser", imports: ["go/parser"] })
extern class Parser {

    @:native("AllErrors") static var AllErrors: go.go.parser.Mode;
    @:native("DeclarationErrors") static var DeclarationErrors: go.go.parser.Mode;
    @:native("ImportsOnly") static var ImportsOnly: go.go.parser.Mode;
    @:native("PackageClauseOnly") static var PackageClauseOnly: go.go.parser.Mode;
    @:native("ParseComments") static var ParseComments: go.go.parser.Mode;
    @:native("SkipObjectResolution") static var SkipObjectResolution: go.go.parser.Mode;
    @:native("SpuriousErrors") static var SpuriousErrors: go.go.parser.Mode;
    @:native("Trace") static var Trace: go.go.parser.Mode;

    @:native("ParseDir") static function parseDir(fset: go.Pointer<go.go.token.FileSet>, path: String, filter: (p0: go.io.fs.FileInfo) -> (Bool), mode: go.go.parser.Mode): (go.Result<go.Map<String, go.Pointer<go.go.ast.Package>>>);
    @:native("ParseExpr") static function parseExpr(x: String): (go.Result<go.go.ast.Expr>);
    @:native("ParseExprFrom") static function parseExprFrom(fset: go.Pointer<go.go.token.FileSet>, filename: String, src: Dynamic, mode: go.go.parser.Mode): (go.Result<go.go.ast.Expr>);
    @:native("ParseFile") static function parseFile(fset: go.Pointer<go.go.token.FileSet>, filename: String, src: Dynamic, mode: go.go.parser.Mode): (go.Result<go.Pointer<go.go.ast.File>>);

}