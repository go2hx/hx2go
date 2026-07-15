package go.go.ast;

@:structInit
@:go.Type({ name: "MapType", instanceName: "ast.MapType", imports: ["go/ast"] })
extern class MapType {

    @:native("Map") var map: go.go.token.Pos;
    @:native("Key") var key: go.go.ast.Expr;
    @:native("Value") var value: go.go.ast.Expr;

function new(map: go.go.token.Pos, key: go.go.ast.Expr, value: go.go.ast.Expr);

    @:native("End") function end(): go.go.token.Pos;
    @:native("Pos") function pos(): go.go.token.Pos;

}