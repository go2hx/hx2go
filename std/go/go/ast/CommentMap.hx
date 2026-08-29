package go.go.ast;

/**
    A CommentMap maps an AST node to a list of comment groups
    associated with it. See [NewCommentMap] for a description of
    the association.
**/
@:go.Type({ name: "CommentMap", instanceName: "ast.CommentMap", imports: ["go/ast"] })
extern class CommentMap {

    /**
        Comments returns the list of comment groups in the comment map.
        The result is sorted in source order.
    **/
    @:native("Comments") function comments(): (go.Slice<go.Pointer<go.go.ast.CommentGroup>>);
    /**
        Filter returns a new comment map consisting of only those
        entries of cmap for which a corresponding node exists in
        the AST specified by node.
    **/
    @:native("Filter") function filter(node: go.go.ast.Node): (go.go.ast.CommentMap);
    @:native("String") function string(): (String);
    /**
        Update replaces an old node in the comment map with the new node
        and returns the new node. Comments that were associated with the
        old node are associated with the new node.
    **/
    @:native("Update") function update(old: go.go.ast.Node, _new: go.go.ast.Node): (go.go.ast.Node);

}