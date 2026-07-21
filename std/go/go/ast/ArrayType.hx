package go.go.ast;

@:structInit
@:go.Type({ name: "ArrayType", instanceName: "ast.ArrayType", imports: ["go/ast"] })
extern class ArrayType {

    @:native("Lbrack") var lbrack: go.go.token.Pos;
    @:native("Len") var len: go.go.ast.Expr;
    @:native("Elt") var elt: go.go.ast.Expr;

    function new(lbrack: go.go.token.Pos, len: go.go.ast.Expr, elt: go.go.ast.Expr);

    @:native("End") function end(): (go.go.token.Pos);
    @:native("Pos") function pos(): (go.go.token.Pos);

}