package go.text.template.parse;

/**
    VariableNode holds a list of variable names, possibly with chained field
    accesses. The dollar sign is part of the (first) name.
**/
@:structInit
@:go.Type({ name: "VariableNode", instanceName: "parse.VariableNode", imports: ["text/template/parse"] })
extern class VariableNode {

    @:native("NodeType") var nodeType: go.text.template.parse.NodeType;
    @:native("Pos") var pos: go.text.template.parse.Pos;
    @:native("Ident") var ident: go.Slice<String>;

    function new(nodeType: go.text.template.parse.NodeType=cast 0, pos: go.text.template.parse.Pos=cast 0, ident: go.Slice<String>=null);

    @:native("Copy") function copy(): (go.text.template.parse.Node);
    @:native("Position") function position(): (go.text.template.parse.Pos);
    @:native("String") function string(): (String);
    @:native("Type") function type(): (go.text.template.parse.NodeType);

}