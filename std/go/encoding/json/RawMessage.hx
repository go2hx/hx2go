package go.encoding.json;

/**
    RawMessage is a raw encoded JSON value.
    It implements [Marshaler] and [Unmarshaler] and can
    be used to delay JSON decoding or precompute a JSON encoding.
**/
@:go.Type({ name: "RawMessage", instanceName: "json.RawMessage", imports: ["encoding/json"] })
extern class RawMessage {

    /**
        MarshalJSON returns m as the JSON encoding of m.
    **/
    @:native("MarshalJSON") function marshalJSON(): (go.Result<go.Slice<go.Byte>>);
    /**
        UnmarshalJSON sets *m to a copy of data.
    **/
    @:native("UnmarshalJSON") function unmarshalJSON(data: go.Slice<go.Byte>): (go.Error);

}