package go.go.ast;

@:structInit
@:go.Type({ name: "Comment", instanceName: "ast.Comment", imports: ["go/ast"] })
extern class Comment {

    @:native("Slash") var slash: go.go.token.Pos;
    @:native("Text") var text: String;

    function new(slash: go.go.token.Pos, text: String);

    @:native("End") function end(): (go.go.token.Pos);
    @:native("Pos") function pos(): (go.go.token.Pos);

}