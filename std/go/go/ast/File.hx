package go.go.ast;

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

    @:native("End") function end(): (go.go.token.Pos);
    @:native("Pos") function pos(): (go.go.token.Pos);

}