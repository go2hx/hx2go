package go.go;

/**
    Package ast declares the types used to represent syntax trees for Go
    packages.
    
    Syntax trees may be constructed directly, but they are typically
    produced from Go source code by the parser; see the ParseFile
    function in package [go/parser].
**/
@:go.Type({ name: "ast", instanceName: "ast.ast", imports: ["go/ast"] })
extern class Ast {

    /**
        The list of possible [Object] kinds.
    **/
    @:native("Bad") static var bad: go.go.ast.ObjKind;
    /**
        The list of possible [Object] kinds.
    **/
    @:native("Con") static var con: go.go.ast.ObjKind;
    /**
        Deprecated: use the type checker [go/types] instead of [Package];
        see [Object].
    **/
    @:native("FilterFuncDuplicates") static var filterFuncDuplicates: go.go.ast.MergeMode;
    /**
        Deprecated: use the type checker [go/types] instead of [Package];
        see [Object].
    **/
    @:native("FilterImportDuplicates") static var filterImportDuplicates: go.go.ast.MergeMode;
    /**
        Deprecated: use the type checker [go/types] instead of [Package];
        see [Object].
    **/
    @:native("FilterUnassociatedComments") static var filterUnassociatedComments: go.go.ast.MergeMode;
    /**
        The list of possible [Object] kinds.
    **/
    @:native("Fun") static var fun: go.go.ast.ObjKind;
    /**
        The list of possible [Object] kinds.
    **/
    @:native("Lbl") static var lbl: go.go.ast.ObjKind;
    /**
        The list of possible [Object] kinds.
    **/
    @:native("Pkg") static var pkg: go.go.ast.ObjKind;
    @:native("RECV") static var RECV: go.go.ast.ChanDir;
    @:native("SEND") static var SEND: go.go.ast.ChanDir;
    /**
        The list of possible [Object] kinds.
    **/
    @:native("Typ") static var typ: go.go.ast.ObjKind;
    /**
        The list of possible [Object] kinds.
    **/
    @:native("Var") static var _var: go.go.ast.ObjKind;

    /**
        FileExports trims the AST for a Go source file in place such that
        only exported nodes remain: all top-level identifiers which are not exported
        and their associated information (such as type, initial value, or function
        body) are removed. Non-exported fields and methods of exported types are
        stripped. The [File.Comments] list is not changed.
        
        FileExports reports whether there are exported declarations.
    **/
    @:native("FileExports") static function fileExports(src: go.Pointer<go.go.ast.File>): (Bool);
    /**
        FilterDecl trims the AST for a Go declaration in place by removing
        all names (including struct field and interface method names, but
        not from parameter lists) that don't pass through the filter f.
        
        FilterDecl reports whether there are any declared names left after
        filtering.
    **/
    @:native("FilterDecl") static function filterDecl(decl: go.go.ast.Decl, f: go.go.ast.Filter): (Bool);
    /**
        FilterFile trims the AST for a Go file in place by removing all
        names from top-level declarations (including struct field and
        interface method names, but not from parameter lists) that don't
        pass through the filter f. If the declaration is empty afterwards,
        the declaration is removed from the AST. Import declarations are
        always removed. The [File.Comments] list is not changed.
        
        FilterFile reports whether there are any top-level declarations
        left after filtering.
    **/
    @:native("FilterFile") static function filterFile(src: go.Pointer<go.go.ast.File>, f: go.go.ast.Filter): (Bool);
    /**
        FilterPackage trims the AST for a Go package in place by removing
        all names from top-level declarations (including struct field and
        interface method names, but not from parameter lists) that don't
        pass through the filter f. If the declaration is empty afterwards,
        the declaration is removed from the AST. The pkg.Files list is not
        changed, so that file names and top-level package comments don't get
        lost.
        
        FilterPackage reports whether there are any top-level declarations
        left after filtering.
        
        Deprecated: use the type checker [go/types] instead of [Package];
        see [Object]. Alternatively, use [FilterFile].
    **/
    @:native("FilterPackage") static function filterPackage(pkg: go.Pointer<go.go.ast.Package>, f: go.go.ast.Filter): (Bool);
    /**
        Fprint prints the (sub-)tree starting at AST node x to w.
        If fset != nil, position information is interpreted relative
        to that file set. Otherwise positions are printed as integer
        values (file set specific offsets).
        
        A non-nil [FieldFilter] f may be provided to control the output:
        struct fields for which f(fieldname, fieldvalue) is true are
        printed; all others are filtered from the output. Unexported
        struct fields are never printed.
    **/
    @:native("Fprint") static function fprint(w: go.io.Writer, fset: go.Pointer<go.go.token.FileSet>, x: Dynamic, f: go.go.ast.FieldFilter): (go.Error);
    /**
        Inspect traverses an AST in depth-first order: It starts by calling
        f(node); node must not be nil. If f returns true, Inspect invokes f
        recursively for each of the non-nil children of node, followed by a
        call of f(nil).
        
        In many cases it may be more convenient to use [Preorder], which
        returns an iterator over the sequence of nodes, or [PreorderStack],
        which (like [Inspect]) provides control over descent into subtrees,
        but additionally reports the stack of enclosing nodes.
    **/
    @:native("Inspect") static function inspect(node: go.go.ast.Node, f: (p0: go.go.ast.Node) -> (Bool)): Void;
    /**
        IsExported reports whether name starts with an upper-case letter.
    **/
    @:native("IsExported") static function isExported(name: String): (Bool);
    /**
        IsGenerated reports whether the file was generated by a program,
        not handwritten, by detecting the special comment described
        at https://go.dev/s/generatedcode.
        
        The syntax tree must have been parsed with the [parser.ParseComments] flag.
        Example:
        
        	f, err := parser.ParseFile(fset, filename, src, parser.ParseComments|parser.PackageClauseOnly)
        	if err != nil { ... }
        	gen := ast.IsGenerated(f)
    **/
    @:native("IsGenerated") static function isGenerated(file: go.Pointer<go.go.ast.File>): (Bool);
    /**
        MergePackageFiles creates a file AST by merging the ASTs of the
        files belonging to a package. The mode flags control merging behavior.
        
        Deprecated: this function is poorly specified and has unfixable
        bugs; also [Package] is deprecated.
    **/
    @:native("MergePackageFiles") static function mergePackageFiles(pkg: go.Pointer<go.go.ast.Package>, mode: go.go.ast.MergeMode): (go.Pointer<go.go.ast.File>);
    /**
        NewCommentMap creates a new comment map by associating comment groups
        of the comments list with the nodes of the AST specified by node.
        
        A comment group g is associated with a node n if:
        
          - g starts on the same line as n ends
          - g starts on the line immediately following n, and there is
            at least one empty line after g and before the next node
          - g starts before n and is not associated to the node before n
            via the previous rules
        
        NewCommentMap tries to associate a comment group to the "largest"
        node possible: For instance, if the comment is a line comment
        trailing an assignment, the comment is associated with the entire
        assignment rather than just the last operand in the assignment.
    **/
    @:native("NewCommentMap") static function newCommentMap(fset: go.Pointer<go.go.token.FileSet>, node: go.go.ast.Node, comments: go.Slice<go.Pointer<go.go.ast.CommentGroup>>): (go.go.ast.CommentMap);
    /**
        NewIdent creates a new [Ident] without position.
        Useful for ASTs generated by code other than the Go parser.
    **/
    @:native("NewIdent") static function newIdent(name: String): (go.Pointer<go.go.ast.Ident>);
    /**
        NewObj creates a new object of a given kind and name.
    **/
    @:native("NewObj") static function newObj(kind: go.go.ast.ObjKind, name: String): (go.Pointer<go.go.ast.Object>);
    /**
        NewPackage creates a new [Package] node from a set of [File] nodes. It resolves
        unresolved identifiers across files and updates each file's Unresolved list
        accordingly. If a non-nil importer and universe scope are provided, they are
        used to resolve identifiers not declared in any of the package files. Any
        remaining unresolved identifiers are reported as undeclared. If the files
        belong to different packages, one package name is selected and files with
        different package names are reported and then ignored.
        The result is a package node and a [scanner.ErrorList] if there were errors.
        
        Deprecated: use the type checker [go/types] instead; see [Object].
    **/
    @:native("NewPackage") static function newPackage(fset: go.Pointer<go.go.token.FileSet>, files: go.Map<String, go.Pointer<go.go.ast.File>>, importer: go.go.ast.Importer, universe: go.Pointer<go.go.ast.Scope>): (go.Result<go.Pointer<go.go.ast.Package>>);
    /**
        NewScope creates a new scope nested in the outer scope.
    **/
    @:native("NewScope") static function newScope(outer: go.Pointer<go.go.ast.Scope>): (go.Pointer<go.go.ast.Scope>);
    /**
        NotNilFilter is a [FieldFilter] that returns true for field values
        that are not nil; it returns false otherwise.
    **/
    @:native("NotNilFilter") static function notNilFilter(_: String, v: go.reflect.Value): (Bool);
    /**
        PackageExports trims the AST for a Go package in place such that
        only exported nodes remain. The pkg.Files list is not changed, so that
        file names and top-level package comments don't get lost.
        
        PackageExports reports whether there are exported declarations;
        it returns false otherwise.
        
        Deprecated: use the type checker [go/types] instead of [Package];
        see [Object]. Alternatively, use [FileExports].
    **/
    @:native("PackageExports") static function packageExports(pkg: go.Pointer<go.go.ast.Package>): (Bool);
    /**
        ParseDirective parses a single comment line for a directive comment.
        
        If the line is not a directive comment, it returns false.
        
        The provided text must be a single line and should include the leading "//".
        If the text does not start with "//", it returns false.
        
        The caller may provide a file position of the start of c. This will be used
        to track the position of the arguments. This may be [Comment.Slash],
        synthesized by the caller, or simply 0. If the caller passes 0, then the
        positions are effectively byte offsets into the string c.
    **/
    @:go.Tuple("p0", "p1") @:native("ParseDirective") static function parseDirective(pos: go.go.token.Pos, c: String): (go.Tuple<{ p0: go.go.ast.Directive, p1: Bool }>);
    /**
        Preorder returns an iterator over all the nodes of the syntax tree
        beneath (and including) the specified root, in depth-first
        preorder.
        
        For greater control over the traversal of each subtree, use
        [Inspect] or [PreorderStack].
    **/
    @:native("Preorder") static function preorder(root: go.go.ast.Node): (go.iter.Seq<go.go.ast.Node>);
    /**
        PreorderStack traverses the tree rooted at root,
        calling f before visiting each node.
        
        Each call to f provides the current node and traversal stack,
        consisting of the original value of stack appended with all nodes
        from root to n, excluding n itself. (This design allows calls
        to PreorderStack to be nested without double counting.)
        
        If f returns false, the traversal skips over that subtree. Unlike
        [Inspect], no second call to f is made after visiting node n.
        (In practice, the second call is nearly always used only to pop the
        stack, and it is surprisingly tricky to do this correctly.)
    **/
    @:native("PreorderStack") static function preorderStack(root: go.go.ast.Node, stack: go.Slice<go.go.ast.Node>, f: (n: go.go.ast.Node, stack: go.Slice<go.go.ast.Node>) -> (Bool)): Void;
    /**
        Print prints x to standard output, skipping nil fields.
        Print(fset, x) is the same as Fprint(os.Stdout, fset, x, NotNilFilter).
    **/
    @:native("Print") static function print(fset: go.Pointer<go.go.token.FileSet>, x: Dynamic): (go.Error);
    /**
        SortImports sorts runs of consecutive import lines in import blocks in f.
        It also removes duplicate imports when it is possible to do so without data loss.
    **/
    @:native("SortImports") static function sortImports(fset: go.Pointer<go.go.token.FileSet>, f: go.Pointer<go.go.ast.File>): Void;
    /**
        Unparen returns the expression with any enclosing parentheses removed.
    **/
    @:native("Unparen") static function unparen(e: go.go.ast.Expr): (go.go.ast.Expr);
    /**
        Walk traverses an AST in depth-first order: It starts by calling
        v.Visit(node); node must not be nil. If the visitor w returned by
        v.Visit(node) is not nil, Walk is invoked recursively with visitor
        w for each of the non-nil children of node, followed by a call of
        w.Visit(nil).
    **/
    @:native("Walk") static function walk(v: go.go.ast.Visitor, node: go.go.ast.Node): Void;

}