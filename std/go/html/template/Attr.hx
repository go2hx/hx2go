package go.html.template;

@:go.Type({ name: "attr", instanceName: "template.attr", imports: ["html/template"] })
extern typedef Attr = haxe.extern.EitherType<go.UInt8, {
    @:native("String") function string(): (String);

}>