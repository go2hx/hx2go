package go.text.template.parse;

@:structInit
@:go.Type({ name: "WithNode", instanceName: "parse.WithNode", imports: ["text/template/parse"] })
extern class WithNode {

    @:native("BranchNode") var branchNode: go.text.template.parse.BranchNode;

function new(branchNode: go.text.template.parse.BranchNode);

    @:native("Copy") function copy(): go.text.template.parse.Node;
    @:native("Position") function position(): go.text.template.parse.Pos;
    @:native("String") function string(): String;
    @:native("Type") function type(): go.text.template.parse.NodeType;

}