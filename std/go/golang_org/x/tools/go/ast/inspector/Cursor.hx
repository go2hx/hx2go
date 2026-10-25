package go.golang_org.x.tools.go.ast.inspector;

/**
    A Cursor represents an [ast.Node]. It is immutable.
    
    Two Cursors compare equal if they represent the same node.
    
    The zero value of Cursor is not valid.
    
    Call [Inspector.Root] to obtain a cursor for the virtual root node
    of the traversal. This is the sole valid cursor for which [Cursor.Node]
    returns nil.
    
    Use the following methods to navigate efficiently around the tree:
      - for ancestors, use [Cursor.Parent] and [Cursor.Enclosing];
      - for children, use [Cursor.Child], [Cursor.Children],
        [Cursor.FirstChild], and [Cursor.LastChild];
      - for siblings, use [Cursor.PrevSibling] and [Cursor.NextSibling];
      - for descendants, use [Cursor.FindByPos], [Cursor.FindNode],
        [Cursor.Inspect], and [Cursor.Preorder].
    
    Use the [Cursor.ChildAt] and [Cursor.ParentEdge] methods for
    information about the edges in a tree: which field (and slice
    element) of the parent node holds the child.
**/
@:structInit
@:go.Type({ name: "Cursor", instanceName: "inspector.Cursor", imports: ["golang.org/x/tools/go/ast/inspector"] })
extern class Cursor {

    /**
        Child returns the cursor for n, which must be a direct child of c's Node.
        
        Child must not be called on the Root node (whose [Cursor.Node] returns nil).
    **/
    @:native("Child") function child(n: go.go.ast.Node): (go.golang_org.x.tools.go.ast.inspector.Cursor);
    /**
        ChildAt returns the cursor for the child of the
        current node identified by its edge and index.
        The index must be -1 if the edge.Kind is not a slice.
        The indicated child node must exist.
        
        ChildAt must not be called on the Root node (whose [Cursor.Node] returns nil).
        
        Invariant: c.Parent().ChildAt(c.ParentEdge()) == c.
    **/
    @:native("ChildAt") function childAt(k: go.golang_org.x.tools.go.ast.edge.Kind, idx: go.GoInt): (go.golang_org.x.tools.go.ast.inspector.Cursor);
    /**
        Children returns an iterator over the direct children of the
        current node, if any.
        
        When using Children, NextChild, and PrevChild, bear in mind that a
        Node's children may come from different fields, some of which may
        be lists of nodes without a distinguished intervening container
        such as [ast.BlockStmt].
        
        For example, [ast.CaseClause] has a field List of expressions and a
        field Body of statements, so the children of a CaseClause are a mix
        of expressions and statements. Other nodes that have "uncontained"
        list fields include:
        
          - [ast.ValueSpec] (Names, Values)
          - [ast.CompositeLit] (Type, Elts)
          - [ast.IndexListExpr] (X, Indices)
          - [ast.CallExpr] (Fun, Args)
          - [ast.AssignStmt] (Lhs, Rhs)
        
        So, do not assume that the previous sibling of an ast.Stmt is also
        an ast.Stmt, or if it is, that they are executed sequentially,
        unless you have established that, say, its parent is a BlockStmt
        or its [Cursor.ParentEdge] is [edge.BlockStmt_List].
        For example, given "for S1; ; S2 {}", the predecessor of S2 is S1,
        even though they are not executed in sequence.
    **/
    @:native("Children") function children(): (go.iter.Seq<go.golang_org.x.tools.go.ast.inspector.Cursor>);
    /**
        Contains reports whether c contains or is equal to c2.
        
        Both Cursors must belong to the same [Inspector];
        neither may be its Root node.
    **/
    @:native("Contains") function contains(c2: go.golang_org.x.tools.go.ast.inspector.Cursor): (Bool);
    /**
        Enclosing returns an iterator over the nodes enclosing the current
        current node, starting with the Cursor itself.
        
        Enclosing must not be called on the Root node (whose [Cursor.Node] returns nil).
        
        The types argument, if non-empty, enables type-based filtering of
        events: the sequence includes only enclosing nodes whose type
        matches an element of the types slice.
    **/
    @:native("Enclosing") function enclosing(types: haxe.Rest<go.go.ast.Node>): (go.iter.Seq<go.golang_org.x.tools.go.ast.inspector.Cursor>);
    /**
        FindByPos returns the cursor for the innermost node n in the tree
        rooted at c such that n.Pos() <= start && end <= n.End().
        (For an *ast.File, it uses the bounds n.FileStart-n.FileEnd.)
        
        An empty range (start == end) between two adjacent nodes is
        considered to belong to the first node.
        
        It returns zero if none is found.
        Precondition: start <= end.
        
        See also [astutil.PathEnclosingInterval], which
        tolerates adjoining whitespace.
    **/
    @:go.Tuple("p0", "p1") @:native("FindByPos") function findByPos(start: go.go.token.Pos, end: go.go.token.Pos): (go.Tuple<{ p0: go.golang_org.x.tools.go.ast.inspector.Cursor, p1: Bool }>);
    /**
        FindNode returns the cursor for node n if it belongs to the subtree
        rooted at c. It returns zero if n is not found.
    **/
    @:go.Tuple("p0", "p1") @:native("FindNode") function findNode(n: go.go.ast.Node): (go.Tuple<{ p0: go.golang_org.x.tools.go.ast.inspector.Cursor, p1: Bool }>);
    /**
        FirstChild returns the first direct child of the current node,
        or zero if it has no children.
    **/
    @:go.Tuple("p0", "p1") @:native("FirstChild") function firstChild(): (go.Tuple<{ p0: go.golang_org.x.tools.go.ast.inspector.Cursor, p1: Bool }>);
    /**
        GoString returns a string describing the cursor's path from the
        root, if any.
    **/
    @:native("GoString") function goString(): (String);
    /**
        Index returns the index of this cursor position within the package.
        
        Clients should not assume anything about the numeric Index value
        except that it increases monotonically throughout the traversal.
        It is provided for use with [Inspector.At].
        
        Index must not be called on the Root node.
    **/
    @:native("Index") function index(): (go.Int32);
    /**
        Inspect visits the nodes of the subtree represented by c in
        depth-first order. It calls f(n) for each node n before it
        visits n's children. If f returns true, Inspect invokes f
        recursively for each of the non-nil children of the node.
        
        Each node is represented by a Cursor that allows access to the
        Node, but may also be used to start a new traversal, or to obtain
        the stack of nodes enclosing the cursor.
        
        The complete traversal sequence is determined by [ast.Inspect].
        The types argument, if non-empty, enables type-based filtering of
        events. The function f if is called only for nodes whose type
        matches an element of the types slice.
    **/
    @:native("Inspect") function inspect(types: go.Slice<go.go.ast.Node>, f: (c: go.golang_org.x.tools.go.ast.inspector.Cursor) -> (Bool)): Void;
    /**
        Inspector returns the cursor's Inspector.
        It returns nil if the Cursor is not valid.
    **/
    @:native("Inspector") function inspector(): (go.Pointer<go.golang_org.x.tools.go.ast.inspector.Inspector>);
    /**
        LastChild returns the last direct child of the current node,
        or zero if it has no children.
    **/
    @:go.Tuple("p0", "p1") @:native("LastChild") function lastChild(): (go.Tuple<{ p0: go.golang_org.x.tools.go.ast.inspector.Cursor, p1: Bool }>);
    /**
        NextSibling returns the cursor for the next sibling node in the same list
        (for example, of files, decls, specs, statements, fields, or expressions) as
        the current node. It returns (zero, false) if the node is the last node in
        the list, or is not part of a list.
        
        NextSibling must not be called on the Root node.
        
        See note at [Cursor.Children].
    **/
    @:go.Tuple("p0", "p1") @:native("NextSibling") function nextSibling(): (go.Tuple<{ p0: go.golang_org.x.tools.go.ast.inspector.Cursor, p1: Bool }>);
    /**
        Node returns the node at the current cursor position,
        or nil for the cursor returned by [Inspector.Root].
    **/
    @:native("Node") function node(): (go.go.ast.Node);
    /**
        Parent returns the parent of the current node.
        
        Parent must not be called on the Root node (whose [Cursor.Node] returns nil).
    **/
    @:native("Parent") function parent(): (go.golang_org.x.tools.go.ast.inspector.Cursor);
    /**
        ParentEdge returns the identity of the field in the parent node
        that holds this cursor's node, and if it is a list, the index within it.
        
        For example, f(x, y) is a CallExpr whose three children are Idents.
        f has edge kind [edge.CallExpr_Fun] and index -1.
        x and y have kind [edge.CallExpr_Args] and indices 0 and 1, respectively.
        
        If called on a child of the Root node, it returns ([edge.Invalid], -1).
        
        ParentEdge must not be called on the Root node (whose [Cursor.Node] returns nil).
    **/
    @:go.Tuple("p0", "p1") @:native("ParentEdge") function parentEdge(): (go.Tuple<{ p0: go.golang_org.x.tools.go.ast.edge.Kind, p1: go.GoInt }>);
    /**
        ParentEdgeIndex returns the index component of the result of [Cursor.ParentEdge].
    **/
    @:native("ParentEdgeIndex") function parentEdgeIndex(): (go.GoInt);
    /**
        ParentEdgeKind returns the kind component of the result of [Cursor.ParentEdge].
    **/
    @:native("ParentEdgeKind") function parentEdgeKind(): (go.golang_org.x.tools.go.ast.edge.Kind);
    /**
        Preorder returns an iterator over the nodes of the subtree
        represented by c in depth-first order. Each node in the sequence is
        represented by a Cursor that allows access to the Node, but may
        also be used to start a new traversal, or to obtain the stack of
        nodes enclosing the cursor.
        
        The traversal sequence is determined by [ast.Inspect]. The types
        argument, if non-empty, enables type-based filtering of events. The
        function f if is called only for nodes whose type matches an
        element of the types slice.
        
        If you need control over descent into subtrees,
        or need both pre- and post-order notifications, use [Cursor.Inspect]
    **/
    @:native("Preorder") function preorder(types: haxe.Rest<go.go.ast.Node>): (go.iter.Seq<go.golang_org.x.tools.go.ast.inspector.Cursor>);
    /**
        PrevSibling returns the cursor for the previous sibling node in the
        same list (for example, of files, decls, specs, statements, fields,
        or expressions) as the current node. It returns zero if the node is
        the first node in the list, or is not part of a list.
        
        It must not be called on the Root node.
        
        See note at [Cursor.Children].
    **/
    @:go.Tuple("p0", "p1") @:native("PrevSibling") function prevSibling(): (go.Tuple<{ p0: go.golang_org.x.tools.go.ast.inspector.Cursor, p1: Bool }>);
    /**
        String returns information about the cursor's node, if any.
    **/
    @:native("String") function string(): (String);
    /**
        Valid reports whether the cursor is valid.
        The zero value of cursor is invalid.
        Unless otherwise documented, it is not safe to call
        any other method on an invalid cursor.
    **/
    @:native("Valid") function valid(): (Bool);

}