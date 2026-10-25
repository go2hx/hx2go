package go.golang_org.x.tools.go.ast.inspector;

/**
    An Inspector provides methods for inspecting
    (traversing) the syntax trees of a package.
**/
@:structInit
@:go.Type({ name: "Inspector", instanceName: "inspector.Inspector", imports: ["golang.org/x/tools/go/ast/inspector"] })
extern class Inspector {

    /**
        At returns the cursor at the specified index in the traversal,
        which must have been obtained from [Cursor.Index] on a Cursor
        belonging to the same Inspector (see [Cursor.Inspector]).
    **/
    @:native("At") function at(index: go.Int32): (go.golang_org.x.tools.go.ast.inspector.Cursor);
    /**
        Nodes visits the nodes of the files supplied to [New] in depth-first
        order. It calls f(n, true) for each node n before it visits n's
        children. If f returns true, Nodes invokes f recursively for each
        of the non-nil children of the node, followed by a call of
        f(n, false).
        
        The complete traversal sequence is determined by [ast.Inspect].
        The types argument, if non-empty, enables type-based filtering of
        events. The function f if is called only for nodes whose type
        matches an element of the types slice.
        
        The [Cursor.Inspect] method provides a richer alternative interface.
        Example:
        
        	in.Root().Inspect(types, func(c Cursor) bool {
        		...
        		return true
        	}
    **/
    @:native("Nodes") function nodes(types: go.Slice<go.go.ast.Node>, f: (n: go.go.ast.Node, push: Bool) -> (Bool)): Void;
    /**
        Preorder visits all the nodes of the files supplied to [New] in
        depth-first order. It calls f(n) for each node n before it visits
        n's children.
        
        The complete traversal sequence is determined by [ast.Inspect].
        The types argument, if non-empty, enables type-based filtering of
        events. The function f is called only for nodes whose type
        matches an element of the types slice.
        
        The [Cursor.Preorder] method provides a richer alternative interface.
        Example:
        
        	for c := range in.Root().Preorder(types) { ... }
    **/
    @:native("Preorder") function preorder(types: go.Slice<go.go.ast.Node>, f: (p0: go.go.ast.Node) -> Void): Void;
    /**
        PreorderSeq returns an iterator that visits all the
        nodes of the files supplied to [New] in depth-first order.
        It visits each node n before n's children.
        The complete traversal sequence is determined by ast.Inspect.
        
        The types argument, if non-empty, enables type-based filtering:
        only nodes whose type matches an element of the types slice are
        included in the sequence.
        
        Example:
        
        	for call := range in.PreorderSeq((*ast.CallExpr)(nil)) { ... }
        
        The [All] function is more convenient if there is exactly one node type:
        
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
    @:native("PreorderSeq") function preorderSeq(types: haxe.Rest<go.go.ast.Node>): (go.iter.Seq<go.go.ast.Node>);
    /**
        Root returns a valid cursor for the virtual root node,
        whose children are the files provided to [New].
        
        Its [Cursor.Node] method return nil.
    **/
    @:native("Root") function root(): (go.golang_org.x.tools.go.ast.inspector.Cursor);
    /**
        WithStack visits nodes in a similar manner to Nodes, but it
        supplies each call to f an additional argument, the current
        traversal stack. The stack's first element is the outermost node,
        an *ast.File; its last is the innermost, n.
        
        The [Cursor.Inspect] method provides a richer alternative interface.
        Example:
        
        	in.Root().Inspect(types, func(c Cursor) bool {
        		stack := slices.Collect(c.Enclosing())
        		...
        		return true
        	})
    **/
    @:native("WithStack") function withStack(types: go.Slice<go.go.ast.Node>, f: (n: go.go.ast.Node, push: Bool, stack: go.Slice<go.go.ast.Node>) -> (Bool)): Void;

}