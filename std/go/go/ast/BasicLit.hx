package go.go.ast;

@:structInit
@:go.Type({ name: "BasicLit", instanceName: "ast.BasicLit", imports: ["go/ast"] })
extern class BasicLit {

    @:native("ValuePos") var valuePos: go.go.token.Pos;
    @:native("ValueEnd") var valueEnd: go.go.token.Pos;
    @:native("Kind") var kind: go.go.token.Token;
    @:native("Value") var value: String;

    function new(valuePos: go.go.token.Pos=cast 0, valueEnd: go.go.token.Pos=cast 0, kind: go.go.token.Token=cast 0, value: String="");

    @:native("End") function end(): (go.go.token.Pos);
    @:native("Pos") function pos(): (go.go.token.Pos);

}