package go.text.template.parse;

/**
    NodeType identifies the type of a parse tree node.
**/
@:go.Type({ name: "NodeType", instanceName: "parse.NodeType", imports: ["text/template/parse"] })
extern typedef NodeType = haxe.extern.EitherType<go.GoInt, {
    /**
        Type returns itself and provides an easy default implementation
        for embedding in a Node. Embedded in all non-trivial Nodes.
    **/
    @:native("Type") function type(): (go.text.template.parse.NodeType);

}>