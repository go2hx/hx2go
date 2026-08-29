package go.text.template.parse;

/**
    RangeNode represents a {{range}} action and its commands.
**/
@:structInit
@:go.Type({ name: "RangeNode", instanceName: "parse.RangeNode", imports: ["text/template/parse"] })
extern class RangeNode {

    @:native("BranchNode") var branchNode: go.text.template.parse.BranchNode;
    @:native("NodeType") var nodeType: go.text.template.parse.NodeType;
    @:native("Pos") var pos: go.text.template.parse.Pos;
    @:native("Line") var line: go.GoInt;
    @:native("Pipe") var pipe: go.Pointer<go.text.template.parse.PipeNode>;
    @:native("List") var list: go.Pointer<go.text.template.parse.ListNode>;
    @:native("ElseList") var elseList: go.Pointer<go.text.template.parse.ListNode>;

    function new(branchNode: go.text.template.parse.BranchNode);

    @:native("Copy") function copy(): (go.text.template.parse.Node);
    @:native("Position") function position(): (go.text.template.parse.Pos);
    @:native("String") function string(): (String);
    @:native("Type") function type(): (go.text.template.parse.NodeType);

}