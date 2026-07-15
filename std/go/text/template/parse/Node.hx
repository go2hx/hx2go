package go.text.template.parse;

@:go.Type({ name: "Node", instanceName: "parse.Node", imports: ["text/template/parse"] })
extern typedef Node = {

    @:native("Copy") function copy(): go.text.template.parse.Node;
    @:native("Position") function position(): go.text.template.parse.Pos;
    @:native("String") function string(): String;
    @:native("Type") function type(): go.text.template.parse.NodeType;

}