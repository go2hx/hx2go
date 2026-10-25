package go.golang_org.x.tools.go.ast;

/**
    Package inspector provides helper functions for traversal over the
    syntax trees of a package, including node filtering by type, and
    materialization of the traversal stack.
    
    During construction, the inspector does a complete traversal and
    builds a list of push/pop events and their node type. Subsequent
    method calls that request a traversal scan this list, rather than walk
    the AST, and perform type filtering using efficient bit sets.
    This representation is sometimes called a "balanced parenthesis tree."
    
    Experiments suggest the inspector's traversals are about 2.5x faster
    than [ast.Inspect], but it may take around 5 traversals for this
    benefit to amortize the inspector's construction cost.
    If efficiency is the primary concern, do not use Inspector for
    one-off traversals.
    
    The [Cursor] type provides a more flexible API for efficient
    navigation of syntax trees in all four "cardinal directions". For
    example, traversals may be nested, so you can find each node of
    type A and then search within it for nodes of type B. Or you can
    traverse from a node to its immediate neighbors: its parent, its
    previous and next sibling, or its first and last child. We
    recommend using methods of Cursor in preference to Inspector where
    possible.
**/
@:go.Type({ name: "inspector", instanceName: "inspector.inspector", imports: ["golang.org/x/tools/go/ast/inspector"] })
extern class Inspector {

    /**
        All[N] returns an iterator over all the nodes of type N.
        N must be a pointer-to-struct type that implements ast.Node.
        
        Example:
        
        	for call := range All[*ast.CallExpr](in) { ... }
        
        See also the newer and more flexible [Cursor] API, which lets you
        start the traversal at an arbitrary node, and reports each matching
        node by its Cursor, enabling easier navigation.
        The above example would be written thus:
        
        	for curCall := range in.Root().Preorder((*ast.CallExpr)(nil)) {
        		call := curCall.Node().(*ast.CallExpr)
        		...
        	}
    **/
    @:native("All") static function all<N: Dynamic, S: Dynamic>(_in: go.Pointer<go.golang_org.x.tools.go.ast.inspector.Inspector>): (go.iter.Seq<N>);
    /**
        New returns an Inspector for the specified syntax trees.
    **/
    @:native("New") static function _new(files: go.Slice<go.Pointer<go.go.ast.File>>): (go.Pointer<go.golang_org.x.tools.go.ast.inspector.Inspector>);

}