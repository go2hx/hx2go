package go.go.ast;

/**
    A File node represents a Go source file.
    
    The Comments list contains all comments in the source file in order of
    appearance, including the comments that are pointed to from other nodes
    via Doc and Comment fields.
    
    For correct printing of source code containing comments (using packages
    go/format and go/printer), special care must be taken to update comments
    when a File's syntax tree is modified: For printing, comments are interspersed
    between tokens based on their position. If syntax tree nodes are
    removed or moved, relevant comments in their vicinity must also be removed
    (from the [File.Comments] list) or moved accordingly (by updating their
    positions). A [CommentMap] may be used to facilitate some of these operations.
    
    Whether and how a comment is associated with a node depends on the
    interpretation of the syntax tree by the manipulating program: except for Doc
    and [Comment] comments directly associated with nodes, the remaining comments
    are "free-floating" (see also issues [#18593], [#20744]).
    
    [#18593]: https://go.dev/issue/18593
    [#20744]: https://go.dev/issue/20744
**/
@:structInit
@:go.Type({ name: "File", instanceName: "ast.File", imports: ["go/ast"] })
extern class File {

    @:native("Doc") var doc: go.Pointer<go.go.ast.CommentGroup>;
    @:native("Package") var _package: go.go.token.Pos;
    @:native("Name") var name: go.Pointer<go.go.ast.Ident>;
    @:native("Decls") var decls: go.Slice<go.go.ast.Decl>;
    @:native("FileStart") var fileStart: go.go.token.Pos;
    @:native("FileEnd") var fileEnd: go.go.token.Pos;
    @:native("Scope") var scope: go.Pointer<go.go.ast.Scope>;
    @:native("Imports") var imports: go.Slice<go.Pointer<go.go.ast.ImportSpec>>;
    @:native("Unresolved") var unresolved: go.Slice<go.Pointer<go.go.ast.Ident>>;
    @:native("Comments") var comments: go.Slice<go.Pointer<go.go.ast.CommentGroup>>;
    @:native("GoVersion") var goVersion: String;

    function new(doc: go.Pointer<go.go.ast.CommentGroup>=null, _package: go.go.token.Pos=cast 0, name: go.Pointer<go.go.ast.Ident>=null, decls: go.Slice<go.go.ast.Decl>=null, fileStart: go.go.token.Pos=cast 0, fileEnd: go.go.token.Pos=cast 0, scope: go.Pointer<go.go.ast.Scope>=null, imports: go.Slice<go.Pointer<go.go.ast.ImportSpec>>=null, unresolved: go.Slice<go.Pointer<go.go.ast.Ident>>=null, comments: go.Slice<go.Pointer<go.go.ast.CommentGroup>>=null, goVersion: String="");

    /**
        End returns the end of the last declaration in the file.
        It may be invalid, for example in an empty file.
        
        (Use FileEnd for the end of the entire file. It is always valid.)
    **/
    @:native("End") function end(): (go.go.token.Pos);
    /**
        Pos returns the position of the package declaration.
        It may be invalid, for example in an empty file.
        
        (Use FileStart for the start of the entire file. It is always valid.)
    **/
    @:native("Pos") function pos(): (go.go.token.Pos);

}