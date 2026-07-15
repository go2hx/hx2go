package go.text.template.parse;

@:structInit
@:go.Type({ name: "CommandNode", instanceName: "parse.CommandNode", imports: ["text/template/parse"] })
extern class CommandNode {

    @:native("NodeType") var nodeType: go.text.template.parse.NodeType;
    @:native("Pos") var pos: go.text.template.parse.Pos;
    @:native("Args") var args: go.Slice<go.text.template.parse.Node>;

function new(nodeType: go.text.template.parse.NodeType, pos: go.text.template.parse.Pos, args: go.Slice<go.text.template.parse.Node>);

    @:native("Copy") function copy(): go.text.template.parse.Node;
    @:native("Position") function position(): go.text.template.parse.Pos;
    @:native("String") function string(): String;
    @:native("Type") function type(): go.text.template.parse.NodeType;

}