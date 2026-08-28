package go.go.ast;

/**
    A SelectorExpr node represents an expression followed by a selector.
**/
@:structInit
@:go.Type({ name: "SelectorExpr", instanceName: "ast.SelectorExpr", imports: ["go/ast"] })
extern class SelectorExpr {

    @:native("X") var X: go.go.ast.Expr;
    @:native("Sel") var sel: go.Pointer<go.go.ast.Ident>;

    function new(X: go.go.ast.Expr=null, sel: go.Pointer<go.go.ast.Ident>=null);

    @:native("End") function end(): (go.go.token.Pos);
    @:native("Pos") function pos(): (go.go.token.Pos);

}