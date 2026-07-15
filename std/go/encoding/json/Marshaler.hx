package go.encoding.json;

@:go.Type({ name: "Marshaler", instanceName: "json.Marshaler", imports: ["encoding/json"] })
extern typedef Marshaler = {

    @:native("MarshalJSON") function marshalJSON(): go.Result<go.Slice<go.Byte>>;

}