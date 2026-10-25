package go.encoding.json.jsontext;

@:go.Type({ name: "objectNamespaceStack", instanceName: "jsontext.objectNamespaceStack", imports: ["encoding/json/jsontext"] })
extern class ObjectNamespaceStack {

    @:native("Last") function last(): (go.Pointer<go.encoding.json.jsontext.ObjectNamespace>);

}