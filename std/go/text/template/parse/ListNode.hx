package go.text.template.parse;

@:structInit
@:go.Type({ name: "ListNode", instanceName: "parse.ListNode", imports: ["text/template/parse"] })
extern class ListNode {

    @:native("NodeType") var nodeType: go.text.template.parse.NodeType;
    @:native("Pos") var pos: go.text.template.parse.Pos;
    @:native("Nodes") var nodes: go.Slice<go.text.template.parse.Node>;

function new(nodeType: go.text.template.parse.NodeType, pos: go.text.template.parse.Pos, nodes: go.Slice<go.text.template.parse.Node>);

    @:native("Copy") function copy(): go.text.template.parse.Node;
    @:native("CopyList") function copyList(): go.Pointer<go.text.template.parse.ListNode>;
    @:native("Position") function position(): go.text.template.parse.Pos;
    @:native("String") function string(): String;
    @:native("Type") function type(): go.text.template.parse.NodeType;

}