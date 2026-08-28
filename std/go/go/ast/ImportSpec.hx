package go.go.ast;

/**
    An ImportSpec node represents a single package import.
**/
@:structInit
@:go.Type({ name: "ImportSpec", instanceName: "ast.ImportSpec", imports: ["go/ast"] })
extern class ImportSpec {

    @:native("Doc") var doc: go.Pointer<go.go.ast.CommentGroup>;
    @:native("Name") var name: go.Pointer<go.go.ast.Ident>;
    @:native("Path") var path: go.Pointer<go.go.ast.BasicLit>;
    @:native("Comment") var comment: go.Pointer<go.go.ast.CommentGroup>;
    @:native("EndPos") var endPos: go.go.token.Pos;

    function new(doc: go.Pointer<go.go.ast.CommentGroup>=null, name: go.Pointer<go.go.ast.Ident>=null, path: go.Pointer<go.go.ast.BasicLit>=null, comment: go.Pointer<go.go.ast.CommentGroup>=null, endPos: go.go.token.Pos=cast 0);

    @:native("End") function end(): (go.go.token.Pos);
    @:native("Pos") function pos(): (go.go.token.Pos);

}