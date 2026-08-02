package go.html.template;

@:go.Type({ name: "jsCtx", instanceName: "template.jsCtx", imports: ["html/template"] })
extern typedef JsCtx = haxe.extern.EitherType<go.UInt8, {
    @:native("String") function string(): (String);

}>