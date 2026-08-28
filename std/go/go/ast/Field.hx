package go.go.ast;

/**
    A Field represents a Field declaration list in a struct type,
    a method list in an interface type, or a parameter/result declaration
    in a signature.
    [Field.Names] is nil for unnamed parameters (parameter lists which only contain types)
    and embedded struct fields. In the latter case, the field name is the type name.
**/
@:structInit
@:go.Type({ name: "Field", instanceName: "ast.Field", imports: ["go/ast"] })
extern class Field {

    @:native("Doc") var doc: go.Pointer<go.go.ast.CommentGroup>;
    @:native("Names") var names: go.Slice<go.Pointer<go.go.ast.Ident>>;
    @:native("Type") var type: go.go.ast.Expr;
    @:native("Tag") var tag: go.Pointer<go.go.ast.BasicLit>;
    @:native("Comment") var comment: go.Pointer<go.go.ast.CommentGroup>;

    function new(doc: go.Pointer<go.go.ast.CommentGroup>=null, names: go.Slice<go.Pointer<go.go.ast.Ident>>=null, type: go.go.ast.Expr=null, tag: go.Pointer<go.go.ast.BasicLit>=null, comment: go.Pointer<go.go.ast.CommentGroup>=null);

    @:native("End") function end(): (go.go.token.Pos);
    @:native("Pos") function pos(): (go.go.token.Pos);

}