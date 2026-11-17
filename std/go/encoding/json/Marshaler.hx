package go.encoding.json;

/**
    Marshaler is the interface implemented by types that
    can marshal themselves into valid JSON.
**/
@:go.Type({ name: "Marshaler", instanceName: "json.Marshaler", imports: ["encoding/json"] })
extern typedef Marshaler = {

    @:native("MarshalJSON") function marshalJSON(): (go.Result<go.Slice<go.Byte>>);

}