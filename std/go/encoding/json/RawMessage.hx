package go.encoding.json;

@:go.Type({ name: "RawMessage", instanceName: "json.RawMessage", imports: ["encoding/json"] })
extern class RawMessage {

    @:native("MarshalJSON") function marshalJSON(): go.Result<go.Slice<go.Byte>>;
    @:native("UnmarshalJSON") function unmarshalJSON(data: go.Slice<go.Byte>): go.Error;

}