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

    function new(nodeType: go.text.template.parse.NodeType=cast 0, pos: go.text.template.parse.Pos=cast 0, line: go.GoInt=0, pipe: go.Pointer<go.text.template.parse.PipeNode>=null, list: go.Pointer<go.text.template.parse.ListNode>=null, elseList: go.Pointer<go.text.template.parse.ListNode>=null);

    @:native("Copy") function copy(): (go.text.template.parse.Node);
    @:native("Position") function position(): (go.text.template.parse.Pos);
    @:native("String") function string(): (String);
    @:native("Type") function type(): (go.text.template.parse.NodeType);

}