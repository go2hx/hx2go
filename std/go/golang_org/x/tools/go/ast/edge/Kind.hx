package go.golang_org.x.tools.go.ast.edge;

/**
    A Kind describes a field of an [ast.Node] struct.
**/
@:go.Type({ name: "Kind", instanceName: "edge.Kind", imports: ["golang.org/x/tools/go/ast/edge"] })
extern typedef Kind = haxe.extern.EitherType<go.UInt8, {
    /**
        FieldName returns the name of the field.
    **/
    @:native("FieldName") function fieldName(): (String);
    /**
        FieldType returns the declared type of the field.
    **/
    @:native("FieldType") function fieldType(): (go.reflect.Type);
    /**
        Get returns the direct child of n identified by (k, idx).
        n's type must match k.NodeType().
        idx must be a valid slice index, or -1 for a non-slice.
    **/
    @:native("Get") function get(n: go.go.ast.Node, idx: go.GoInt): (go.go.ast.Node);
    /**
        NodeType returns the pointer-to-struct type of the ast.Node implementation.
    **/
    @:native("NodeType") function nodeType(): (go.reflect.Type);
    /**
        String returns a description of the edge kind.
    **/
    @:native("String") function string(): (String);

}>