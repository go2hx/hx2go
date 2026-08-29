package go.go.ast;

/**
    A MapType node represents a map type.
**/
@:structInit
@:go.Type({ name: "MapType", instanceName: "ast.MapType", imports: ["go/ast"] })
extern class MapType {

    @:native("Map") var map: go.go.token.Pos;
    @:native("Key") var key: go.go.ast.Expr;
    @:native("Value") var value: go.go.ast.Expr;

    function new(map: go.go.token.Pos=cast 0, key: go.go.ast.Expr=null, value: go.go.ast.Expr=null);

    @:native("End") function end(): (go.go.token.Pos);
    @:native("Pos") function pos(): (go.go.token.Pos);

}