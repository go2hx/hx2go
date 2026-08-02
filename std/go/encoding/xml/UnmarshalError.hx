package go.encoding.xml;

@:go.Type({ name: "UnmarshalError", instanceName: "xml.UnmarshalError", imports: ["encoding/xml"] })
extern typedef UnmarshalError = haxe.extern.EitherType<String, {
    @:native("Error") function error(): (String);

}>