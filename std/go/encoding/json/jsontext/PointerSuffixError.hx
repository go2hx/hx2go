package go.encoding.json.jsontext;

@:structInit
@:go.Type({ name: "pointerSuffixError", instanceName: "jsontext.pointerSuffixError", imports: ["encoding/json/jsontext"] })
extern class PointerSuffixError {

    @:native("Error") function error(): (std.String);

}