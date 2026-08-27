package go.go.ast;

@:structInit
@:go.Type({ name: "TypeSpec", instanceName: "ast.TypeSpec", imports: ["go/ast"] })
extern class TypeSpec {

    @:native("Doc") var doc: go.Pointer<go.go.ast.CommentGroup>;
    @:native("Name") var name: go.Pointer<go.go.ast.Ident>;
    @:native("TypeParams") var typeParams: go.Pointer<go.go.ast.FieldList>;
    @:native("Assign") var assign: go.go.token.Pos;
    @:native("Type") var type: go.go.ast.Expr;
    @:native("Comment") var comment: go.Pointer<go.go.ast.CommentGroup>;

    function new(doc: go.Pointer<go.go.ast.CommentGroup>=null, name: go.Pointer<go.go.ast.Ident>=null, typeParams: go.Pointer<go.go.ast.FieldList>=null, assign: go.go.token.Pos=cast 0, type: go.go.ast.Expr=null, comment: go.Pointer<go.go.ast.CommentGroup>=null);

    @:native("End") function end(): (go.go.token.Pos);
    @:native("Pos") function pos(): (go.go.token.Pos);

}