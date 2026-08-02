package go.golang_org.x.tools.go.ast.edge;

@:go.Type({ name: "Kind", instanceName: "edge.Kind", imports: ["golang.org/x/tools/go/ast/edge"] })
extern typedef Kind = haxe.extern.EitherType<go.UInt8, {
    @:native("FieldName") function fieldName(): (String);
    @:native("FieldType") function fieldType(): (go.reflect.Type);
    @:native("Get") function get(n: go.go.ast.Node, idx: go.GoInt): (go.go.ast.Node);
    @:native("NodeType") function nodeType(): (go.reflect.Type);
    @:native("String") function string(): (String);

}>