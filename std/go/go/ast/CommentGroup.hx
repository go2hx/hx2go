package go.go.ast;

@:structInit
@:go.Type({ name: "CommentGroup", instanceName: "ast.CommentGroup", imports: ["go/ast"] })
extern class CommentGroup {

    @:native("List") var list: go.Slice<go.Pointer<go.go.ast.Comment>>;

function new(list: go.Slice<go.Pointer<go.go.ast.Comment>>);

    @:native("End") function end(): go.go.token.Pos;
    @:native("Pos") function pos(): go.go.token.Pos;
    @:native("Text") function text(): String;

}