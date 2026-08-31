package go.encoding.json;

/**
    An UnsupportedValueError is returned by [Marshal] when attempting
    to encode an unsupported value.
**/
@:structInit
@:go.Type({ name: "UnsupportedValueError", instanceName: "json.UnsupportedValueError", imports: ["encoding/json"] })
extern class UnsupportedValueError {

    @:native("Value") var value: go.reflect.Value;
    @:native("Str") var str: String;

    function new(value: go.reflect.Value, str: String="");

    @:native("Error") function error(): (String);

}