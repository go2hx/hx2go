package go.text.template.parse;

/**
    NilNode holds the special identifier 'nil' representing an untyped nil constant.
**/
@:structInit
@:go.Type({ name: "NilNode", instanceName: "parse.NilNode", imports: ["text/template/parse"] })
extern class NilNode {

    @:native("NodeType") var nodeType: go.text.template.parse.NodeType;
    @:native("Pos") var pos: go.text.template.parse.Pos;

    function new(nodeType: go.text.template.parse.NodeType=cast 0, pos: go.text.template.parse.Pos=cast 0);

    @:native("Copy") function copy(): (go.text.template.parse.Node);
    @:native("Position") function position(): (go.text.template.parse.Pos);
    @:native("String") function string(): (String);
    @:native("Type") function type(): (go.text.template.parse.NodeType);

}