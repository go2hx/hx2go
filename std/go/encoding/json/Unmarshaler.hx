package go.encoding.json;

/**
    Unmarshaler is the interface implemented by types
    that can unmarshal a JSON description of themselves.
    The input can be assumed to be a valid encoding of
    a JSON value. UnmarshalJSON must copy the JSON data
    if it wishes to retain the data after returning.
**/
@:go.Type({ name: "Unmarshaler", instanceName: "json.Unmarshaler", imports: ["encoding/json"] })
extern typedef Unmarshaler = {

    @:native("UnmarshalJSON") function unmarshalJSON(p0: go.Slice<go.Byte>): (go.Error);

}