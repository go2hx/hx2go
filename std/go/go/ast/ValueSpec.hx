package go.go.ast;

@:structInit
@:go.Type({ name: "ValueSpec", instanceName: "ast.ValueSpec", imports: ["go/ast"] })
extern class ValueSpec {

    @:native("Doc") var doc: go.Pointer<go.go.ast.CommentGroup>;
    @:native("Names") var names: go.Slice<go.Pointer<go.go.ast.Ident>>;
    @:native("Type") var type: go.go.ast.Expr;
    @:native("Values") var values: go.Slice<go.go.ast.Expr>;
    @:native("Comment") var comment: go.Pointer<go.go.ast.CommentGroup>;

    function new(doc: go.Pointer<go.go.ast.CommentGroup>=null, names: go.Slice<go.Pointer<go.go.ast.Ident>>=null, type: go.go.ast.Expr=null, values: go.Slice<go.go.ast.Expr>=null, comment: go.Pointer<go.go.ast.CommentGroup>=null);

    @:native("End") function end(): (go.go.token.Pos);
    @:native("Pos") function pos(): (go.go.token.Pos);

}