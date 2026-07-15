package go.text.template.parse;

@:structInit
@:go.Type({ name: "CommentNode", instanceName: "parse.CommentNode", imports: ["text/template/parse"] })
extern class CommentNode {

    @:native("NodeType") var nodeType: go.text.template.parse.NodeType;
    @:native("Pos") var pos: go.text.template.parse.Pos;
    @:native("Text") var text: String;

function new(nodeType: go.text.template.parse.NodeType, pos: go.text.template.parse.Pos, text: String);

    @:native("Copy") function copy(): go.text.template.parse.Node;
    @:native("Position") function position(): go.text.template.parse.Pos;
    @:native("String") function string(): String;
    @:native("Type") function type(): go.text.template.parse.NodeType;

}