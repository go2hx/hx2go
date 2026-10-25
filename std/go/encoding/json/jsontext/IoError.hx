package go.encoding.json.jsontext;

@:structInit
@:go.Type({ name: "ioError", instanceName: "jsontext.ioError", imports: ["encoding/json/jsontext"] })
extern class IoError {

    @:native("Error") function error(): (std.String);
    @:native("Unwrap") function unwrap(): (go.Error);

}