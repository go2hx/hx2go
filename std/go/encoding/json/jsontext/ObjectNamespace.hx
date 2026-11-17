package go.encoding.json.jsontext;

@:structInit
@:go.Type({ name: "objectNamespace", instanceName: "jsontext.objectNamespace", imports: ["encoding/json/jsontext"] })
extern class ObjectNamespace {

    @:native("InsertUnquoted") function insertUnquoted(name: go.Slice<go.Byte>): (Bool);

}