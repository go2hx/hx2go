package go.encoding.xml;

@:structInit
@:go.Type({ name: "UnsupportedTypeError", instanceName: "xml.UnsupportedTypeError", imports: ["encoding/xml"] })
extern class UnsupportedTypeError {

    @:native("Type") var type: go.reflect.Type;

function new(type: go.reflect.Type);

    @:native("Error") function error(): String;

}