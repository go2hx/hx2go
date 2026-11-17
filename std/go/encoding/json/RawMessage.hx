package go.encoding.json;

/**
    RawMessage is a raw encoded JSON value.
    It implements [Marshaler] and [Unmarshaler] and can
    be used to delay JSON decoding or precompute a JSON encoding.
**/
@:go.Type({ name: "RawMessage", instanceName: "json.RawMessage", imports: ["encoding/json"] })
extern typedef RawMessage = go.encoding.json.jsontext.Value