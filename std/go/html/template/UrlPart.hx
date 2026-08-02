package go.html.template;

@:go.Type({ name: "urlPart", instanceName: "template.urlPart", imports: ["html/template"] })
extern typedef UrlPart = haxe.extern.EitherType<go.UInt8, {
    @:native("String") function string(): (String);

}>