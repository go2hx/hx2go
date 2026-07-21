package go.go.ast;

@:structInit
@:go.Type({ name: "Field", instanceName: "ast.Field", imports: ["go/ast"] })
extern class Field {

    @:native("Doc") var doc: go.Pointer<go.go.ast.CommentGroup>;
    @:native("Names") var names: go.Slice<go.Pointer<go.go.ast.Ident>>;
    @:native("Type") var type: go.go.ast.Expr;
    @:native("Tag") var tag: go.Pointer<go.go.ast.BasicLit>;
    @:native("Comment") var comment: go.Pointer<go.go.ast.CommentGroup>;

    function new(doc: go.Pointer<go.go.ast.CommentGroup>, names: go.Slice<go.Pointer<go.go.ast.Ident>>, type: go.go.ast.Expr, tag: go.Pointer<go.go.ast.BasicLit>, comment: go.Pointer<go.go.ast.CommentGroup>);

    @:native("End") function end(): (go.go.token.Pos);
    @:native("Pos") function pos(): (go.go.token.Pos);

}