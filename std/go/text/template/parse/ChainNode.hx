package go.text.template.parse;

@:structInit
@:go.Type({ name: "ChainNode", instanceName: "parse.ChainNode", imports: ["text/template/parse"] })
extern class ChainNode {

    @:native("NodeType") var nodeType: go.text.template.parse.NodeType;
    @:native("Pos") var pos: go.text.template.parse.Pos;
    @:native("Node") var node: go.text.template.parse.Node;
    @:native("Field") var field: go.Slice<String>;

function new(nodeType: go.text.template.parse.NodeType, pos: go.text.template.parse.Pos, node: go.text.template.parse.Node, field: go.Slice<String>);

    @:native("Add") function add(field: String): Void;
    @:native("Copy") function copy(): go.text.template.parse.Node;
    @:native("Position") function position(): go.text.template.parse.Pos;
    @:native("String") function string(): String;
    @:native("Type") function type(): go.text.template.parse.NodeType;

}