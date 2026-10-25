package go.encoding.json.jsontext;

@:structInit
@:go.Type({ name: "decodeBuffer", instanceName: "jsontext.decodeBuffer", imports: ["encoding/json/jsontext"] })
extern class DecodeBuffer {

    @:native("PreviousTokenOrValue") function previousTokenOrValue(): (go.Slice<go.Byte>);

}