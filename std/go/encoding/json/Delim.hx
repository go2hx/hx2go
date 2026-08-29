package go.encoding.json;

/**
    A Delim is a JSON array or object delimiter, one of [ ] { or }.
**/
@:go.Type({ name: "Delim", instanceName: "json.Delim", imports: ["encoding/json"] })
extern typedef Delim = haxe.extern.EitherType<go.Rune, {
    @:native("String") function string(): (String);

}>