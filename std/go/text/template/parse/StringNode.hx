package go.text.template.parse;

@:structInit
@:go.Type({ name: "StringNode", instanceName: "parse.StringNode", imports: ["text/template/parse"] })
extern class StringNode {

    @:native("NodeType") var nodeType: go.text.template.parse.NodeType;
    @:native("Pos") var pos: go.text.template.parse.Pos;
    @:native("Quoted") var quoted: String;
    @:native("Text") var text: String;

    function new(nodeType: go.text.template.parse.NodeType=cast 0, pos: go.text.template.parse.Pos=cast 0, quoted: String="", text: String="");

    @:native("Copy") function copy(): (go.text.template.parse.Node);
    @:native("Position") function position(): (go.text.template.parse.Pos);
    @:native("String") function string(): (String);
    @:native("Type") function type(): (go.text.template.parse.NodeType);

}