package go.go.ast;

@:structInit
@:go.Type({ name: "SelectorExpr", instanceName: "ast.SelectorExpr", imports: ["go/ast"] })
extern class SelectorExpr {

    @:native("X") var X: go.go.ast.Expr;
    @:native("Sel") var sel: go.Pointer<go.go.ast.Ident>;

    function new(X: go.go.ast.Expr, sel: go.Pointer<go.go.ast.Ident>);

    @:native("End") function end(): (go.go.token.Pos);
    @:native("Pos") function pos(): (go.go.token.Pos);

}