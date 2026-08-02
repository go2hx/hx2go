package go.encoding.json;

@:go.Type({ name: "tagOptions", instanceName: "json.tagOptions", imports: ["encoding/json"] })
extern typedef TagOptions = haxe.extern.EitherType<String, {
    @:native("Contains") function contains(optionName: String): (Bool);

}>