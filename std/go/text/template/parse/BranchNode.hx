package go.text.template.parse;

@:structInit
@:go.Type({ name: "BranchNode", instanceName: "parse.BranchNode", imports: ["text/template/parse"] })
extern class BranchNode {

    @:native("NodeType") var nodeType: go.text.template.parse.NodeType;
    @:native("Pos") var pos: go.text.template.parse.Pos;
    @:native("Line") var line: go.GoInt;
    @:native("Pipe") var pipe: go.Pointer<go.text.template.parse.PipeNode>;
    @:native("List") var list: go.Pointer<go.text.template.parse.ListNode>;
    @:native("ElseList") var elseList: go.Pointer<go.text.template.parse.ListNode>;

function new(nodeType: go.text.template.parse.NodeType, pos: go.text.template.parse.Pos, line: go.GoInt, pipe: go.Pointer<go.text.template.parse.PipeNode>, list: go.Pointer<go.text.template.parse.ListNode>, elseList: go.Pointer<go.text.template.parse.ListNode>);

    @:native("Copy") function copy(): go.text.template.parse.Node;
    @:native("Position") function position(): go.text.template.parse.Pos;
    @:native("String") function string(): String;
    @:native("Type") function type(): go.text.template.parse.NodeType;

}