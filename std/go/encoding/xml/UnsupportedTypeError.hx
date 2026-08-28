package go.encoding.xml;

/**
    UnsupportedTypeError is returned when [Marshal] encounters a type
    that cannot be converted into XML.
**/
@:structInit
@:go.Type({ name: "UnsupportedTypeError", instanceName: "xml.UnsupportedTypeError", imports: ["encoding/xml"] })
extern class UnsupportedTypeError {

    @:native("Type") var type: go.reflect.Type;

    function new(type: go.reflect.Type=null);

    @:native("Error") function error(): (String);

}