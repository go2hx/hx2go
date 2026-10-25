package go.encoding.json.jsontext;

@:structInit
@:go.Type({ name: "objectNameStack", instanceName: "jsontext.objectNameStack", imports: ["encoding/json/jsontext"] })
extern class ObjectNameStack {

    @:native("ReplaceLastQuotedOffset") function replaceLastQuotedOffset(i: go.GoInt): Void;

}