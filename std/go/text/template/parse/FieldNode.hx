package go.text.template.parse;

@:structInit
@:go.Type({ name: "FieldNode", instanceName: "parse.FieldNode", imports: ["text/template/parse"] })
extern class FieldNode {

    @:native("NodeType") var nodeType: go.text.template.parse.NodeType;
    @:native("Pos") var pos: go.text.template.parse.Pos;
    @:native("Ident") var ident: go.Slice<String>;

function new(nodeType: go.text.template.parse.NodeType, pos: go.text.template.parse.Pos, ident: go.Slice<String>);

    @:native("Copy") function copy(): go.text.template.parse.Node;
    @:native("Position") function position(): go.text.template.parse.Pos;
    @:native("String") function string(): String;
    @:native("Type") function type(): go.text.template.parse.NodeType;

}