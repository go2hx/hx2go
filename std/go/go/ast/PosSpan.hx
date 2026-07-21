package go.go.ast;

@:structInit
@:go.Type({ name: "posSpan", instanceName: "ast.posSpan", imports: ["go/ast"] })
extern class PosSpan {

    @:native("Start") var start: go.go.token.Pos;
    @:native("End") var end: go.go.token.Pos;

    function new(start: go.go.token.Pos, end: go.go.token.Pos);

}