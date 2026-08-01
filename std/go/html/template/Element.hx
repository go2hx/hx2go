package go.html.template;

@:go.Type({ name: "element", instanceName: "template.element", imports: ["html/template"] })
extern typedef Element = haxe.extern.EitherType<go.UInt8, {
    @:native("String") function string(): (String);

}>