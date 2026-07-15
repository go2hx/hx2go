package go.go.ast;

@:structInit
@:go.Type({ name: "SliceExpr", instanceName: "ast.SliceExpr", imports: ["go/ast"] })
extern class SliceExpr {

    @:native("X") var X: go.go.ast.Expr;
    @:native("Lbrack") var lbrack: go.go.token.Pos;
    @:native("Low") var low: go.go.ast.Expr;
    @:native("High") var high: go.go.ast.Expr;
    @:native("Max") var max: go.go.ast.Expr;
    @:native("Slice3") var slice3: Bool;
    @:native("Rbrack") var rbrack: go.go.token.Pos;

function new(X: go.go.ast.Expr, lbrack: go.go.token.Pos, low: go.go.ast.Expr, high: go.go.ast.Expr, max: go.go.ast.Expr, slice3: Bool, rbrack: go.go.token.Pos);

    @:native("End") function end(): go.go.token.Pos;
    @:native("Pos") function pos(): go.go.token.Pos;

}