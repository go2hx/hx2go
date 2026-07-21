package go.encoding.json;

@:structInit
@:go.Type({ name: "jsonError", instanceName: "json.jsonError", imports: ["encoding/json"] })
extern class JsonError {

    @:native("Error") function error(): (String);

}