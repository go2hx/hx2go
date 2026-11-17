package go.encoding.json.v2;

/**
    MarshalerTo is implemented by types that can marshal themselves.
    It is recommended that types implement MarshalerTo instead of [Marshaler]
    since it is both more performant and more flexible.
    If a type implements both Marshaler and MarshalerTo,
    then MarshalerTo takes precedence. In such a case, both implementations
    should aim to have equivalent behavior for the default marshal options.
    
    The implementation must write only one JSON value to the Encoder.
    Alternatively, it may return [errors.ErrUnsupported] without mutating
    the Encoder. The "json" package calling the method will
    use the next available JSON representation for the receiver type,
    as described in [Marshal].
    Implementations must not retain the pointer to [jsontext.Encoder].
    
    If the returned error is a [SemanticError], then unpopulated fields
    of the error may be populated by [json] with additional context.
    Errors of other types are wrapped within a [SemanticError],
    except for IO errors.
    
    The MarshalJSONTo method should not be called directly as it may
    return sentinel errors that need special handling.
    Users should instead call [MarshalEncode], which handles such cases.
    
    Implementations should inspect the marshal options from
    [jsontext.Encoder.Options] and adjust behavior to respect the options as
    necessary.
    
    The following options may be relevant to MarshalerTo implementations:
    
    - [Deterministic]: if the implementation may produce non-deterministic output
    - [StringifyNumbers]: if the type is represented as a JSON number
    
    Several options, such as [FormatNilSliceAsNull], apply only to native Go
    types. Thus, these options are typically not directly relevant to
    MarshalerTo implementations. However, types representing a composite type
    should marshal contained types using [MarshalEncode] to ensure these options
    apply to the contained types. Similarly, [WithMarshalers] may influence
    marshaling of any contained type within a composite type.
    
    All other options are automatically handled outside of the MarshalerTo
    implementation, and thus are not relevant to implementations.
**/
@:go.Type({ name: "MarshalerTo", instanceName: "json.MarshalerTo", imports: ["encoding/json/v2"] })
extern typedef MarshalerTo = {

    @:native("MarshalJSONTo") function marshalJSONTo(p0: go.Pointer<go.encoding.json.jsontext.Encoder>): (go.Error);

}