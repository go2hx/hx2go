package go.encoding.json;

@:go.Type({ name: "Delim", instanceName: "json.Delim", imports: ["encoding/json"] })
extern typedef Delim = haxe.extern.EitherType<go.Rune, {
    @:native("String") function string(): (String);

}>