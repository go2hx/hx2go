package go.text.template.parse;

@:structInit
@:go.Type({ name: "DotNode", instanceName: "parse.DotNode", imports: ["text/template/parse"] })
extern class DotNode {

    @:native("NodeType") var nodeType: go.text.template.parse.NodeType;
    @:native("Pos") var pos: go.text.template.parse.Pos;

function new(nodeType: go.text.template.parse.NodeType, pos: go.text.template.parse.Pos);

    @:native("Copy") function copy(): go.text.template.parse.Node;
    @:native("Position") function position(): go.text.template.parse.Pos;
    @:native("String") function string(): String;
    @:native("Type") function type(): go.text.template.parse.NodeType;

}