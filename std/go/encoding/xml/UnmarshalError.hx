package go.encoding.xml;

/**
    An UnmarshalError represents an error in the unmarshaling process.
**/
@:go.Type({ name: "UnmarshalError", instanceName: "xml.UnmarshalError", imports: ["encoding/xml"] })
extern typedef UnmarshalError = haxe.extern.EitherType<String, {
    @:native("Error") function error(): (String);

}>