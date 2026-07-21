package go.go.ast;

@:structInit
@:go.Type({ name: "BadDecl", instanceName: "ast.BadDecl", imports: ["go/ast"] })
extern class BadDecl {

    @:native("From") var _from: go.go.token.Pos;
    @:native("To") var _to: go.go.token.Pos;

    function new(_from: go.go.token.Pos, _to: go.go.token.Pos);

    @:native("End") function end(): (go.go.token.Pos);
    @:native("Pos") function pos(): (go.go.token.Pos);

}