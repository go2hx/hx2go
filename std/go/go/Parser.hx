package go.go;

/**
    Package parser implements a parser for Go source files.
    
    The [ParseFile] function reads file input from a string, []byte, or
    io.Reader, and produces an [ast.File] representing the complete
    abstract syntax tree of the file.
    
    The [ParseExprFrom] function reads a single source-level expression and
    produces an [ast.Expr], the syntax tree of the expression.
    
    The parser accepts a larger language than is syntactically permitted by
    the Go spec, for simplicity, and for improved robustness in the presence
    of syntax errors. For instance, in method declarations, the receiver is
    treated like an ordinary parameter list and thus may contain multiple
    entries where the spec permits exactly one. Consequently, the corresponding
    field in the AST (ast.FuncDecl.Recv) field is not restricted to one entry.
    
    Applications that need to parse one or more complete packages of Go
    source code may find it more convenient not to interact directly
    with the parser but instead to use the Load function in package
    [golang.org/x/tools/go/packages].
**/
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

    /**
        ParseDir calls [ParseFile] for all files with names ending in ".go" in the
        directory specified by path and returns a map of package name -> package
        AST with all the packages found.
        
        If filter != nil, only the files with [fs.FileInfo] entries passing through
        the filter (and ending in ".go") are considered. The mode bits are passed
        to [ParseFile] unchanged. Position information is recorded in fset, which
        must not be nil.
        
        If the directory couldn't be read, a nil map and the respective error are
        returned. If a parse error occurred, a non-nil but incomplete map and the
        first error encountered are returned.
        
        Deprecated: ParseDir does not consider build tags when associating
        files with packages. For precise information about the relationship
        between packages and files, use golang.org/x/tools/go/packages,
        which can also optionally parse and type-check the files too.
    **/
    @:native("ParseDir") static function parseDir(fset: go.Pointer<go.go.token.FileSet>, path: String, filter: (p0: go.io.fs.FileInfo) -> (Bool), mode: go.go.parser.Mode): (go.Result<go.Map<String, go.Pointer<go.go.ast.Package>>>);
    /**
        ParseExpr is a convenience function for obtaining the AST of an expression x.
        The position information recorded in the AST is undefined. The filename used
        in error messages is the empty string.
        
        If syntax errors were found, the result is a partial AST (with [ast.Bad]* nodes
        representing the fragments of erroneous source code). Multiple errors are
        returned via a scanner.ErrorList which is sorted by source position.
    **/
    @:native("ParseExpr") static function parseExpr(x: String): (go.Result<go.go.ast.Expr>);
    /**
        ParseExprFrom is a convenience function for parsing an expression.
        The arguments have the same meaning as for [ParseFile], but the source must
        be a valid Go (type or value) expression. Specifically, fset must not
        be nil.
        
        If the source couldn't be read, the returned AST is nil and the error
        indicates the specific failure. If the source was read but syntax
        errors were found, the result is a partial AST (with [ast.Bad]* nodes
        representing the fragments of erroneous source code). Multiple errors
        are returned via a scanner.ErrorList which is sorted by source position.
    **/
    @:native("ParseExprFrom") static function parseExprFrom(fset: go.Pointer<go.go.token.FileSet>, filename: String, src: Dynamic, mode: go.go.parser.Mode): (go.Result<go.go.ast.Expr>);
    /**
        ParseFile parses the source code of a single Go source file and returns
        the corresponding [ast.File] node. The source code may be provided via
        the filename of the source file, or via the src parameter.
        
        If src != nil, ParseFile parses the source from src and the filename is
        only used when recording position information. The type of the argument
        for the src parameter must be string, []byte, or [io.Reader].
        If src == nil, ParseFile parses the file specified by filename.
        
        The mode parameter controls the amount of source text parsed and
        other optional parser functionality. If the [SkipObjectResolution]
        mode bit is set (recommended), the object resolution phase of
        parsing will be skipped, causing File.Scope, File.Unresolved, and
        all Ident.Obj fields to be nil. Those fields are deprecated; see
        [ast.Object] for details.
        
        Position information is recorded in the file set fset, which must not be
        nil.
        
        If the source couldn't be read, the returned AST is nil and the error
        indicates the specific failure. If the source was read but syntax
        errors were found, the result is a partial AST (with [ast.Bad]* nodes
        representing the fragments of erroneous source code). Multiple errors
        are returned via a scanner.ErrorList which is sorted by source position.
    **/
    @:native("ParseFile") static function parseFile(fset: go.Pointer<go.go.token.FileSet>, filename: String, src: Dynamic, mode: go.go.parser.Mode): (go.Result<go.Pointer<go.go.ast.File>>);

}