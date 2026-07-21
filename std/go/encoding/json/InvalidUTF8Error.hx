package go.encoding.json;

@:structInit
@:go.Type({ name: "InvalidUTF8Error", instanceName: "json.InvalidUTF8Error", imports: ["encoding/json"] })
extern class InvalidUTF8Error {

    @:native("S") var S: String;

    function new(S: String);

    @:native("Error") function error(): (String);

}