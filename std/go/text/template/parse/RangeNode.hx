package go.text.template.parse;

@:structInit
@:go.Type({ name: "RangeNode", instanceName: "parse.RangeNode", imports: ["text/template/parse"] })
extern class RangeNode {

    @:native("BranchNode") var branchNode: go.text.template.parse.BranchNode;

function new(branchNode: go.text.template.parse.BranchNode);

    @:native("Copy") function copy(): go.text.template.parse.Node;
    @:native("Position") function position(): go.text.template.parse.Pos;
    @:native("String") function string(): String;
    @:native("Type") function type(): go.text.template.parse.NodeType;

}