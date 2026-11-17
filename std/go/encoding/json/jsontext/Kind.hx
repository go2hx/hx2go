package go.encoding.json.jsontext;

/**
    A Kind represents the kind of a JSON token.
    
    A Kind is a single byte, which is conveniently the first byte of that
    kind's symbol in the grammar (except for numbers, which are always represented
    with '0').
**/
@:go.Type({ name: "Kind", instanceName: "jsontext.Kind", imports: ["encoding/json/jsontext"] })
extern typedef Kind = haxe.extern.EitherType<go.Byte, {
    /**
        String returns a string representation of k.
    **/
    @:native("String") function string(): (std.String);

}>