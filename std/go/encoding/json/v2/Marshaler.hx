package go.encoding.json.v2;

/**
    Marshaler is implemented by types that can marshal themselves.
    It is recommended that types implement [MarshalerTo] unless the implementation
    is trying to avoid directly depending on the "jsontext" package.
    
    Implementations should return a buffer that is safe
    for the caller to retain and potentially mutate.
    
    Implementations must not return [errors.ErrUnsupported].
    
    If the returned error is a [SemanticError], then unpopulated fields
    of the error may be populated by [json] with additional context.
    Errors of other types are wrapped within a [SemanticError].
    
    Implementations should assume [Deterministic] is true and return
    deterministic output.
**/
@:go.Type({ name: "Marshaler", instanceName: "json.Marshaler", imports: ["encoding/json/v2"] })
extern typedef Marshaler = {

    @:native("MarshalJSON") function marshalJSON(): (go.Result<go.Slice<go.Byte>>);

}