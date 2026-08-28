package go.text.template.parse;

/**
    TextNode holds plain text.
**/
@:structInit
@:go.Type({ name: "TextNode", instanceName: "parse.TextNode", imports: ["text/template/parse"] })
extern class TextNode {

    @:native("NodeType") var nodeType: go.text.template.parse.NodeType;
    @:native("Pos") var pos: go.text.template.parse.Pos;
    @:native("Text") var text: go.Slice<go.Byte>;

    function new(nodeType: go.text.template.parse.NodeType=cast 0, pos: go.text.template.parse.Pos=cast 0, text: go.Slice<go.Byte>=null);

    @:native("Copy") function copy(): (go.text.template.parse.Node);
    @:native("Position") function position(): (go.text.template.parse.Pos);
    @:native("String") function string(): (String);
    @:native("Type") function type(): (go.text.template.parse.NodeType);

}