package go.encoding.asn1;

@:structInit
@:go.Type({ name: "invalidUnmarshalError", instanceName: "asn1.invalidUnmarshalError", imports: ["encoding/asn1"] })
extern class InvalidUnmarshalError {

    @:native("Type") var type: go.reflect.Type;

    function new(type: go.reflect.Type=null);

    @:native("Error") function error(): (String);

}