package go.encoding.json.jsontext;

@:structInit
@:go.Type({ name: "numError", instanceName: "jsontext.numError", imports: ["encoding/json/jsontext"] })
extern class NumError {

    @:native("Error") function error(): (std.String);
    @:native("Unwrap") function unwrap(): (go.Error);

}