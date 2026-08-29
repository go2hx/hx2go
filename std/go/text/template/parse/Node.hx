package go.text.template.parse;

/**
    A Node is an element in the parse tree. The interface is trivial.
    The interface contains an unexported method so that only
    types local to this package can satisfy it.
**/
@:go.Type({ name: "Node", instanceName: "parse.Node", imports: ["text/template/parse"] })
extern typedef Node = {

    @:native("Copy") function copy(): (go.text.template.parse.Node);
    @:native("Position") function position(): (go.text.template.parse.Pos);
    @:native("String") function string(): (String);
    @:native("Type") function type(): (go.text.template.parse.NodeType);

}