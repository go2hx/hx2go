package go.text.template.parse;

@:go.Type({ name: "NodeType", instanceName: "parse.NodeType", imports: ["text/template/parse"] })
extern typedef NodeType = haxe.extern.EitherType<go.GoInt, {
    @:native("Type") function type(): (go.text.template.parse.NodeType);

}>