package go.golang_org.x.tools.go.ast.inspector;

@:structInit
@:go.Type({ name: "Inspector", instanceName: "inspector.Inspector", imports: ["golang.org/x/tools/go/ast/inspector"] })
extern class Inspector {

    @:native("At") function at(index: go.Int32): (go.golang_org.x.tools.go.ast.inspector.Cursor);
    @:native("Nodes") function nodes(types: go.Slice<go.go.ast.Node>, f: (n: go.go.ast.Node, push: Bool) -> (Bool)): Void;
    @:native("Preorder") function preorder(types: go.Slice<go.go.ast.Node>, f: (p0: go.go.ast.Node) -> Void): Void;
    @:native("PreorderSeq") function preorderSeq(types: haxe.Rest<go.go.ast.Node>): (go.iter.Seq<go.go.ast.Node>);
    @:native("Root") function root(): (go.golang_org.x.tools.go.ast.inspector.Cursor);
    @:native("WithStack") function withStack(types: go.Slice<go.go.ast.Node>, f: (n: go.go.ast.Node, push: Bool, stack: go.Slice<go.go.ast.Node>) -> (Bool)): Void;

}