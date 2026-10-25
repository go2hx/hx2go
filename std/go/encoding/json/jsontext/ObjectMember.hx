package go.encoding.json.jsontext;

@:structInit
@:go.Type({ name: "objectMember", instanceName: "jsontext.objectMember", imports: ["encoding/json/jsontext"] })
extern class ObjectMember {

    @:native("Compare") function compare(y: go.encoding.json.jsontext.ObjectMember): (go.GoInt);

}