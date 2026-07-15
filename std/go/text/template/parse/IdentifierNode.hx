package go.text.template.parse;

@:structInit
@:go.Type({ name: "IdentifierNode", instanceName: "parse.IdentifierNode", imports: ["text/template/parse"] })
extern class IdentifierNode {

    @:native("NodeType") var nodeType: go.text.template.parse.NodeType;
    @:native("Pos") var pos: go.text.template.parse.Pos;
    @:native("Ident") var ident: String;

function new(nodeType: go.text.template.parse.NodeType, pos: go.text.template.parse.Pos, ident: String);

    @:native("Copy") function copy(): go.text.template.parse.Node;
    @:native("Position") function position(): go.text.template.parse.Pos;
    @:native("SetPos") function setPos(pos: go.text.template.parse.Pos): go.Pointer<go.text.template.parse.IdentifierNode>;
    @:native("SetTree") function setTree(t: go.Pointer<go.text.template.parse.Tree>): go.Pointer<go.text.template.parse.IdentifierNode>;
    @:native("String") function string(): String;
    @:native("Type") function type(): go.text.template.parse.NodeType;

}