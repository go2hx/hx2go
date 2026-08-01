package go.html.template;

@:go.Type({ name: "state", instanceName: "template.state", imports: ["html/template"] })
extern typedef State = haxe.extern.EitherType<go.UInt8, {
    @:native("String") function string(): (String);

}>