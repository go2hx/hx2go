package go.go.ast;

@:structInit
@:go.Type({ name: "ChanType", instanceName: "ast.ChanType", imports: ["go/ast"] })
extern class ChanType {

    @:native("Begin") var begin: go.go.token.Pos;
    @:native("Arrow") var arrow: go.go.token.Pos;
    @:native("Dir") var dir: go.go.ast.ChanDir;
    @:native("Value") var value: go.go.ast.Expr;

function new(begin: go.go.token.Pos, arrow: go.go.token.Pos, dir: go.go.ast.ChanDir, value: go.go.ast.Expr);

    @:native("End") function end(): go.go.token.Pos;
    @:native("Pos") function pos(): go.go.token.Pos;

}