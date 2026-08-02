package go.golang_org.x.tools.go.ast.inspector;

@:structInit
@:go.Type({ name: "Cursor", instanceName: "inspector.Cursor", imports: ["golang.org/x/tools/go/ast/inspector"] })
extern class Cursor {

    @:native("Child") function child(n: go.go.ast.Node): (go.golang_org.x.tools.go.ast.inspector.Cursor);
    @:native("ChildAt") function childAt(k: go.golang_org.x.tools.go.ast.edge.Kind, idx: go.GoInt): (go.golang_org.x.tools.go.ast.inspector.Cursor);
    @:native("Children") function children(): (go.iter.Seq<go.golang_org.x.tools.go.ast.inspector.Cursor>);
    @:native("Contains") function contains(c2: go.golang_org.x.tools.go.ast.inspector.Cursor): (Bool);
    @:native("Enclosing") function enclosing(types: haxe.Rest<go.go.ast.Node>): (go.iter.Seq<go.golang_org.x.tools.go.ast.inspector.Cursor>);
    @:go.Tuple("p0", "p1") @:native("FindByPos") function findByPos(start: go.go.token.Pos, end: go.go.token.Pos): (go.Tuple<{ p0: go.golang_org.x.tools.go.ast.inspector.Cursor, p1: Bool }>);
    @:go.Tuple("p0", "p1") @:native("FindNode") function findNode(n: go.go.ast.Node): (go.Tuple<{ p0: go.golang_org.x.tools.go.ast.inspector.Cursor, p1: Bool }>);
    @:go.Tuple("p0", "p1") @:native("FirstChild") function firstChild(): (go.Tuple<{ p0: go.golang_org.x.tools.go.ast.inspector.Cursor, p1: Bool }>);
    @:native("Index") function index(): (go.Int32);
    @:native("Inspect") function inspect(types: go.Slice<go.go.ast.Node>, f: (c: go.golang_org.x.tools.go.ast.inspector.Cursor) -> (Bool)): Void;
    @:native("Inspector") function inspector(): (go.Pointer<go.golang_org.x.tools.go.ast.inspector.Inspector>);
    @:go.Tuple("p0", "p1") @:native("LastChild") function lastChild(): (go.Tuple<{ p0: go.golang_org.x.tools.go.ast.inspector.Cursor, p1: Bool }>);
    @:go.Tuple("p0", "p1") @:native("NextSibling") function nextSibling(): (go.Tuple<{ p0: go.golang_org.x.tools.go.ast.inspector.Cursor, p1: Bool }>);
    @:native("Node") function node(): (go.go.ast.Node);
    @:native("Parent") function parent(): (go.golang_org.x.tools.go.ast.inspector.Cursor);
    @:go.Tuple("p0", "p1") @:native("ParentEdge") function parentEdge(): (go.Tuple<{ p0: go.golang_org.x.tools.go.ast.edge.Kind, p1: go.GoInt }>);
    @:native("ParentEdgeIndex") function parentEdgeIndex(): (go.GoInt);
    @:native("ParentEdgeKind") function parentEdgeKind(): (go.golang_org.x.tools.go.ast.edge.Kind);
    @:native("Preorder") function preorder(types: haxe.Rest<go.go.ast.Node>): (go.iter.Seq<go.golang_org.x.tools.go.ast.inspector.Cursor>);
    @:go.Tuple("p0", "p1") @:native("PrevSibling") function prevSibling(): (go.Tuple<{ p0: go.golang_org.x.tools.go.ast.inspector.Cursor, p1: Bool }>);
    @:native("String") function string(): (String);
    @:native("Valid") function valid(): (Bool);

}