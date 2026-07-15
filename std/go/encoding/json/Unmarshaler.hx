package go.encoding.json;

@:go.Type({ name: "Unmarshaler", instanceName: "json.Unmarshaler", imports: ["encoding/json"] })
extern typedef Unmarshaler = {

    @:native("UnmarshalJSON") function unmarshalJSON(p0: go.Slice<go.Byte>): go.Error;

}