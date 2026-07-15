package go.text.template.parse;

@:structInit
@:go.Type({ name: "TextNode", instanceName: "parse.TextNode", imports: ["text/template/parse"] })
extern class TextNode {

    @:native("NodeType") var nodeType: go.text.template.parse.NodeType;
    @:native("Pos") var pos: go.text.template.parse.Pos;
    @:native("Text") var text: go.Slice<go.Byte>;

function new(nodeType: go.text.template.parse.NodeType, pos: go.text.template.parse.Pos, text: go.Slice<go.Byte>);

    @:native("Copy") function copy(): go.text.template.parse.Node;
    @:native("Position") function position(): go.text.template.parse.Pos;
    @:native("String") function string(): String;
    @:native("Type") function type(): go.text.template.parse.NodeType;

}