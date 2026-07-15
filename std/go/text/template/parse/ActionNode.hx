package go.text.template.parse;

@:structInit
@:go.Type({ name: "ActionNode", instanceName: "parse.ActionNode", imports: ["text/template/parse"] })
extern class ActionNode {

    @:native("NodeType") var nodeType: go.text.template.parse.NodeType;
    @:native("Pos") var pos: go.text.template.parse.Pos;
    @:native("Line") var line: go.GoInt;
    @:native("Pipe") var pipe: go.Pointer<go.text.template.parse.PipeNode>;

function new(nodeType: go.text.template.parse.NodeType, pos: go.text.template.parse.Pos, line: go.GoInt, pipe: go.Pointer<go.text.template.parse.PipeNode>);

    @:native("Copy") function copy(): go.text.template.parse.Node;
    @:native("Position") function position(): go.text.template.parse.Pos;
    @:native("String") function string(): String;
    @:native("Type") function type(): go.text.template.parse.NodeType;

}