package go.text.template.parse;

/**
    IdentifierNode holds an identifier.
**/
@:structInit
@:go.Type({ name: "IdentifierNode", instanceName: "parse.IdentifierNode", imports: ["text/template/parse"] })
extern class IdentifierNode {

    @:native("NodeType") var nodeType: go.text.template.parse.NodeType;
    @:native("Pos") var pos: go.text.template.parse.Pos;
    @:native("Ident") var ident: String;

    function new(nodeType: go.text.template.parse.NodeType=cast 0, pos: go.text.template.parse.Pos=cast 0, ident: String="");

    @:native("Copy") function copy(): (go.text.template.parse.Node);
    @:native("Position") function position(): (go.text.template.parse.Pos);
    /**
        SetPos sets the position. [NewIdentifier] is a public method so we can't modify its signature.
        Chained for convenience.
        TODO: fix one day?
    **/
    @:native("SetPos") function setPos(pos: go.text.template.parse.Pos): (go.Pointer<go.text.template.parse.IdentifierNode>);
    /**
        SetTree sets the parent tree for the node. [NewIdentifier] is a public method so we can't modify its signature.
        Chained for convenience.
        TODO: fix one day?
    **/
    @:native("SetTree") function setTree(t: go.Pointer<go.text.template.parse.Tree>): (go.Pointer<go.text.template.parse.IdentifierNode>);
    @:native("String") function string(): (String);
    @:native("Type") function type(): (go.text.template.parse.NodeType);

}