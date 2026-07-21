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

    function new(doc: go.Pointer<go.go.ast.CommentGroup>, name: go.Pointer<go.go.ast.Ident>, typeParams: go.Pointer<go.go.ast.FieldList>, assign: go.go.token.Pos, type: go.go.ast.Expr, comment: go.Pointer<go.go.ast.CommentGroup>);

    @:native("End") function end(): (go.go.token.Pos);
    @:native("Pos") function pos(): (go.go.token.Pos);

}