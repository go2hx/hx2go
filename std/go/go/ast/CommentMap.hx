package go.go.ast;

@:go.Type({ name: "CommentMap", instanceName: "ast.CommentMap", imports: ["go/ast"] })
extern class CommentMap {

    @:native("Comments") function comments(): (go.Slice<go.Pointer<go.go.ast.CommentGroup>>);
    @:native("Filter") function filter(node: go.go.ast.Node): (go.go.ast.CommentMap);
    @:native("String") function string(): (String);
    @:native("Update") function update(old: go.go.ast.Node, _new: go.go.ast.Node): (go.go.ast.Node);

}