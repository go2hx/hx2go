package go.encoding.json.v2;

/**
    Unmarshaler is implemented by types that can unmarshal themselves.
    It is recommended that types implement [UnmarshalerFrom] unless the implementation
    is trying to avoid a direct dependency on the "jsontext" package.
    
    The input can be assumed to be a valid encoding of a JSON value
    if called from unmarshal functionality in this package.
    It is recommended that UnmarshalJSON implement merge semantics
    when unmarshaling into a pre-populated value, as described in [Unmarshal].
    
    Implementations must not retain or mutate the input []byte.
    
    Implementations must not return [errors.ErrUnsupported].
    
    If the returned error is a [SemanticError], then unpopulated fields
    of the error may be populated by [json] with additional context.
    Errors of other types are wrapped within a [SemanticError].
**/
@:go.Type({ name: "Unmarshaler", instanceName: "json.Unmarshaler", imports: ["encoding/json/v2"] })
extern typedef Unmarshaler = {

    @:native("UnmarshalJSON") function unmarshalJSON(p0: go.Slice<go.Byte>): (go.Error);

}