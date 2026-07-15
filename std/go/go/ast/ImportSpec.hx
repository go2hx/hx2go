package go.go.ast;

@:structInit
@:go.Type({ name: "ImportSpec", instanceName: "ast.ImportSpec", imports: ["go/ast"] })
extern class ImportSpec {

    @:native("Doc") var doc: go.Pointer<go.go.ast.CommentGroup>;
    @:native("Name") var name: go.Pointer<go.go.ast.Ident>;
    @:native("Path") var path: go.Pointer<go.go.ast.BasicLit>;
    @:native("Comment") var comment: go.Pointer<go.go.ast.CommentGroup>;
    @:native("EndPos") var endPos: go.go.token.Pos;

function new(doc: go.Pointer<go.go.ast.CommentGroup>, name: go.Pointer<go.go.ast.Ident>, path: go.Pointer<go.go.ast.BasicLit>, comment: go.Pointer<go.go.ast.CommentGroup>, endPos: go.go.token.Pos);

    @:native("End") function end(): go.go.token.Pos;
    @:native("Pos") function pos(): go.go.token.Pos;

}