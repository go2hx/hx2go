package go.go.ast;

/**
    A ChanType node represents a channel type.
**/
@:structInit
@:go.Type({ name: "ChanType", instanceName: "ast.ChanType", imports: ["go/ast"] })
extern class ChanType {

    @:native("Begin") var begin: go.go.token.Pos;
    @:native("Arrow") var arrow: go.go.token.Pos;
    @:native("Dir") var dir: go.go.ast.ChanDir;
    @:native("Value") var value: go.go.ast.Expr;

    function new(begin: go.go.token.Pos=cast 0, arrow: go.go.token.Pos=cast 0, dir: go.go.ast.ChanDir=cast 0, value: go.go.ast.Expr=null);

    @:native("End") function end(): (go.go.token.Pos);
    @:native("Pos") function pos(): (go.go.token.Pos);

}