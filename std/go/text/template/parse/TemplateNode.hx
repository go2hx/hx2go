package go.text.template.parse;

@:structInit
@:go.Type({ name: "TemplateNode", instanceName: "parse.TemplateNode", imports: ["text/template/parse"] })
extern class TemplateNode {

    @:native("NodeType") var nodeType: go.text.template.parse.NodeType;
    @:native("Pos") var pos: go.text.template.parse.Pos;
    @:native("Line") var line: go.GoInt;
    @:native("Name") var name: String;
    @:native("Pipe") var pipe: go.Pointer<go.text.template.parse.PipeNode>;

    function new(nodeType: go.text.template.parse.NodeType=cast 0, pos: go.text.template.parse.Pos=cast 0, line: go.GoInt=0, name: String="", pipe: go.Pointer<go.text.template.parse.PipeNode>=null);

    @:native("Copy") function copy(): (go.text.template.parse.Node);
    @:native("Position") function position(): (go.text.template.parse.Pos);
    @:native("String") function string(): (String);
    @:native("Type") function type(): (go.text.template.parse.NodeType);

}