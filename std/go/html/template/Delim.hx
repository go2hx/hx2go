package go.html.template;

@:go.Type({ name: "delim", instanceName: "template.delim", imports: ["html/template"] })
extern typedef Delim = haxe.extern.EitherType<go.UInt8, {
    @:native("String") function string(): (String);

}>