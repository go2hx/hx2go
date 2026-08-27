package go.text.template.parse;

@:structInit
@:go.Type({ name: "BoolNode", instanceName: "parse.BoolNode", imports: ["text/template/parse"] })
extern class BoolNode {

    @:native("NodeType") var nodeType: go.text.template.parse.NodeType;
    @:native("Pos") var pos: go.text.template.parse.Pos;
    @:native("True") var _true: Bool;

    function new(nodeType: go.text.template.parse.NodeType=cast 0, pos: go.text.template.parse.Pos=cast 0, _true: Bool=false);

    @:native("Copy") function copy(): (go.text.template.parse.Node);
    @:native("Position") function position(): (go.text.template.parse.Pos);
    @:native("String") function string(): (String);
    @:native("Type") function type(): (go.text.template.parse.NodeType);

}