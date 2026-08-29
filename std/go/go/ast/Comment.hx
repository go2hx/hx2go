package go.go.ast;

/**
    A Comment node represents a single //-style or /*-style comment.
    
    The Text field contains the comment text without carriage returns (\r) that
    may have been present in the source. Because a comment's end position is
    computed using len(Text), the position reported by [Comment.End] does not match the
    true source end position for comments containing carriage returns.
**/
@:structInit
@:go.Type({ name: "Comment", instanceName: "ast.Comment", imports: ["go/ast"] })
extern class Comment {

    @:native("Slash") var slash: go.go.token.Pos;
    @:native("Text") var text: String;

    function new(slash: go.go.token.Pos=cast 0, text: String="");

    @:native("End") function end(): (go.go.token.Pos);
    @:native("Pos") function pos(): (go.go.token.Pos);

}