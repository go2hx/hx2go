package go.go.ast;

/**
    A CommentGroup represents a sequence of comments
    with no other tokens and no empty lines between.
**/
@:structInit
@:go.Type({ name: "CommentGroup", instanceName: "ast.CommentGroup", imports: ["go/ast"] })
extern class CommentGroup {

    @:native("List") var list: go.Slice<go.Pointer<go.go.ast.Comment>>;

    function new(list: go.Slice<go.Pointer<go.go.ast.Comment>>=null);

    @:native("End") function end(): (go.go.token.Pos);
    @:native("Pos") function pos(): (go.go.token.Pos);
    /**
        Text returns the text of the comment.
        Comment markers (//, /*, and * /), the first space of a line comment, and
        leading and trailing empty lines are removed.
        Comment directives like "//line" and "//go:noinline" are also removed.
        Multiple empty lines are reduced to one, and trailing space on lines is trimmed.
        Unless the result is empty, it is newline-terminated.
    **/
    @:native("Text") function text(): (String);

}