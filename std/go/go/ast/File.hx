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

function new(doc: go.Pointer<go.go.ast.CommentGroup>, _package: go.go.token.Pos, name: go.Pointer<go.go.ast.Ident>, decls: go.Slice<go.go.ast.Decl>, fileStart: go.go.token.Pos, fileEnd: go.go.token.Pos, scope: go.Pointer<go.go.ast.Scope>, imports: go.Slice<go.Pointer<go.go.ast.ImportSpec>>, unresolved: go.Slice<go.Pointer<go.go.ast.Ident>>, comments: go.Slice<go.Pointer<go.go.ast.CommentGroup>>, goVersion: String);

    @:native("End") function end(): go.go.token.Pos;
    @:native("Pos") function pos(): go.go.token.Pos;

}