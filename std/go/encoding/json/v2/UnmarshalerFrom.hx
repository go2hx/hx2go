package go.encoding.json.v2;

/**
    UnmarshalerFrom is implemented by types that can unmarshal themselves.
    It is recommended that types implement UnmarshalerFrom instead of [Unmarshaler]
    since this is both more performant and more flexible.
    If a type implements both Unmarshaler and UnmarshalerFrom,
    then UnmarshalerFrom takes precedence. In such a case, both implementations
    should aim to have equivalent behavior for the default unmarshal options.
    
    The implementation must read only one JSON value from the Decoder.
    It is recommended that UnmarshalJSONFrom implement merge semantics when
    unmarshaling into a pre-populated value, as described in [Unmarshal].
    Alternatively, it may return [errors.ErrUnsupported] without mutating
    the Decoder. The "json" package calling the method will
    use the next available JSON representation for the receiver type.
    Implementations must not retain the pointer to [jsontext.Decoder].
    
    If the returned error is a [SemanticError], then unpopulated fields
    of the error may be populated by [json] with additional context.
    Errors of other types are wrapped within a [SemanticError],
    except for [jsontext.SyntacticError]s and IO errors.
    
    The UnmarshalJSONFrom method should not be called directly as it may
    return sentinel errors that need special handling.
    Users should instead call [UnmarshalDecode], which handles such cases.
    
    Implementations should inspect the unmarshal options from
    [jsontext.Decoder.Options] and adjust behavior to respect the options as
    necessary.
    
    The following options may be relevant to UnmarshalerFrom implementations:
    
    - [StringifyNumbers]: if the type is represented as a JSON number
    
    Several options, such as [FormatNilSliceAsNull], apply only to native Go
    types. Thus, these options are typically not directly relevant to
    UnmarshalerFrom implementations. However, types representing a composite
    type should unmarshal contained types using [UnmarshalDecode] to ensure
    these options apply to the contained types. Similarly, [WithUnmarshalers]
    may influence unmarshaling of any contained type within a composite type.
    
    All other options are automatically handled outside of the UnmarshalerFrom
    implementation, and thus are not relevant to implementations.
**/
@:go.Type({ name: "UnmarshalerFrom", instanceName: "json.UnmarshalerFrom", imports: ["encoding/json/v2"] })
extern typedef UnmarshalerFrom = {

    @:native("UnmarshalJSONFrom") function unmarshalJSONFrom(p0: go.Pointer<go.encoding.json.jsontext.Decoder>): (go.Error);

}