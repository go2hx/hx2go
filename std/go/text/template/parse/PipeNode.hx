package go.text.template.parse;

@:structInit
@:go.Type({ name: "PipeNode", instanceName: "parse.PipeNode", imports: ["text/template/parse"] })
extern class PipeNode {

    @:native("NodeType") var nodeType: go.text.template.parse.NodeType;
    @:native("Pos") var pos: go.text.template.parse.Pos;
    @:native("Line") var line: go.GoInt;
    @:native("IsAssign") var isAssign: Bool;
    @:native("Decl") var decl: go.Slice<go.Pointer<go.text.template.parse.VariableNode>>;
    @:native("Cmds") var cmds: go.Slice<go.Pointer<go.text.template.parse.CommandNode>>;

function new(nodeType: go.text.template.parse.NodeType, pos: go.text.template.parse.Pos, line: go.GoInt, isAssign: Bool, decl: go.Slice<go.Pointer<go.text.template.parse.VariableNode>>, cmds: go.Slice<go.Pointer<go.text.template.parse.CommandNode>>);

    @:native("Copy") function copy(): go.text.template.parse.Node;
    @:native("CopyPipe") function copyPipe(): go.Pointer<go.text.template.parse.PipeNode>;
    @:native("Position") function position(): go.text.template.parse.Pos;
    @:native("String") function string(): String;
    @:native("Type") function type(): go.text.template.parse.NodeType;

}