package go.encoding.json.v2;

@:go.Type({ name: "json", instanceName: "json.json", imports: ["encoding/json/v2"] })
extern class Json {

    /**
        DefaultOptionsV2 is the full set of all options that define v2 semantics.
        It is equivalent to the set of options in [encoding/json.DefaultOptionsV1]
        all being set to false. All other options are not present.
    **/
    @:native("DefaultOptionsV2") static function defaultOptionsV2(): (go.encoding.json.v2.Options);
    /**
        Deterministic specifies that marshaling the same input value will always
        serialize as the same output bytes.
        
        For example, Go maps are marshaled sorted by key.
        
        For native Go types, Determinism is guaranteed across different instances of
        identical binaries, but not across different builds of a program (such as
        different source or toolchain version, different GOOS/GOARCH, different
        build flags).
        
        A Go type with a custom marshaler should also respect the Deterministic
        option and serialize deterministically if it is true.
        
        This only affects marshaling and is ignored when unmarshaling.
    **/
    @:native("Deterministic") static function deterministic(v: Bool): (go.encoding.json.v2.Options);
    /**
        FormatNilMapAsNull specifies that a nil Go map should marshal as a
        JSON null instead of the default representation as an empty JSON object.
        
        This only affects marshaling and is ignored when unmarshaling.
    **/
    @:native("FormatNilMapAsNull") static function formatNilMapAsNull(v: Bool): (go.encoding.json.v2.Options);
    /**
        FormatNilSliceAsNull specifies that a nil Go slice should marshal as a
        JSON null instead of the default representation as an empty JSON array
        (or an empty JSON string in the case of ~[]byte).
        
        This only affects marshaling and is ignored when unmarshaling.
    **/
    @:native("FormatNilSliceAsNull") static function formatNilSliceAsNull(v: Bool): (go.encoding.json.v2.Options);
    /**
        GetOption returns the value stored in opts with the provided setter,
        reporting whether the value is present.
        If not present, the returned value is the zero value for type T.
        
        Example usage:
        
        	v, ok := json.GetOption(opts, json.Deterministic)
        
        Options are most commonly introspected to alter the JSON representation of
        [MarshalerTo.MarshalJSONTo] and [UnmarshalerFrom.UnmarshalJSONFrom] methods, and
        [MarshalToFunc] and [UnmarshalFromFunc] functions.
        In such cases, the presence bit should generally be ignored.
    **/
    @:go.Tuple("p0", "p1") @:native("GetOption") static function getOption<T: Dynamic>(opts: go.encoding.json.v2.Options, setter: (p0: T) -> (go.encoding.json.v2.Options)): (go.Tuple<{ p0: T, p1: Bool }>);
    /**
        JoinMarshalers constructs a flattened list of marshal functions.
        If multiple functions in the list are applicable for a value of a given type,
        then those earlier in the list take precedence over those that come later.
        If a function returns [errors.ErrUnsupported],
        then the next applicable function is called,
        otherwise the default marshaling behavior is used.
        
        For example:
        
        	m1 := JoinMarshalers(f1, f2)
        	m2 := JoinMarshalers(f0, m1, f3)     // equivalent to m3
        	m3 := JoinMarshalers(f0, f1, f2, f3) // equivalent to m2
    **/
    @:native("JoinMarshalers") static function joinMarshalers(ms: haxe.Rest<go.Pointer<go.encoding.json.v2.Marshalers>>): (go.Pointer<go.encoding.json.v2.Marshalers>);
    /**
        JoinOptions coalesces the provided list of options into a single Options.
        Properties set in later options override the value of previously set properties.
    **/
    @:native("JoinOptions") static function joinOptions(srcs: haxe.Rest<go.encoding.json.v2.Options>): (go.encoding.json.v2.Options);
    /**
        JoinUnmarshalers constructs a flattened list of unmarshal functions.
        If multiple functions in the list are applicable for a value of a given type,
        then those earlier in the list take precedence over those that come later.
        If a function returns [errors.ErrUnsupported],
        then the next applicable function is called,
        otherwise the default unmarshaling behavior is used.
        
        For example:
        
        	u1 := JoinUnmarshalers(f1, f2)
        	u2 := JoinUnmarshalers(f0, u1, f3)     // equivalent to u3
        	u3 := JoinUnmarshalers(f0, f1, f2, f3) // equivalent to u2
    **/
    @:native("JoinUnmarshalers") static function joinUnmarshalers(us: haxe.Rest<go.Pointer<go.encoding.json.v2.Unmarshalers>>): (go.Pointer<go.encoding.json.v2.Unmarshalers>);
    /**
        Marshal serializes a Go value as a []byte according to the provided
        marshal and encode options (while ignoring unmarshal or decode options).
        It does not terminate the output with a newline.
        
        Type-specific marshal functions and methods take precedence
        over the default representation of a value.
        Functions or methods that operate on *T are only called when encoding
        a value of type T (by taking its address) or a non-nil value of *T.
        Marshal ensures that a value is always addressable
        (by copying the value if necessary) so that
        these functions and methods can be consistently called. For performance,
        it is recommended that Marshal be passed a non-nil pointer to the value.
        
        The input value is encoded as JSON according to the following rules:
        
          - If any type-specific functions in a [WithMarshalers] option match
            the value type, then those functions are called to encode the value.
            If all applicable functions return [errors.ErrUnsupported],
            then the value is encoded according to subsequent rules.
        
          - If the value type implements [MarshalerTo],
            then the MarshalJSONTo method is called to encode the value.
            If the method returns [errors.ErrUnsupported],
            then the input is encoded according to subsequent rules.
        
          - If the value type implements [Marshaler],
            then the MarshalJSON method is called to encode the value.
        
          - If the value type implements [encoding.TextAppender],
            then the AppendText method is called to encode the value and
            subsequently encode its result as a JSON string.
        
          - If the value type implements [encoding.TextMarshaler],
            then the MarshalText method is called to encode the value and
            subsequently encode its result as a JSON string.
        
          - Otherwise, the value is encoded according to the value's type
            as described in detail below.
        
        Most Go types have a default JSON representation as follows:
        
          - A Go boolean is encoded as a JSON boolean (e.g., true or false).
        
          - A Go string is encoded as a JSON string.
        
          - A Go []byte or [N]byte is encoded as a JSON string containing
            a binary value using Base 64 Encoding per RFC 4648, section 4.
        
          - A Go integer is encoded as a JSON number without fractions or exponents.
            If [StringifyNumbers] is specified or encoding a JSON object name,
            then the JSON number is encoded within a JSON string.
        
          - A Go float is encoded as a JSON number.
            If [StringifyNumbers] is specified or encoding a JSON object name,
            then the JSON number is encoded within a JSON string.
            Encoding a NaN or ±Inf results in a [SemanticError].
        
          - A Go map is encoded as a JSON object, where each Go map key and value
            is recursively encoded as a name and value pair in the JSON object.
            The Go map key must encode as a JSON string, otherwise this results
            in a [SemanticError]. The Go map is traversed in a non-deterministic order.
            For deterministic encoding, consider using the [Deterministic] option.
            By default, a nil map is encoded as an empty JSON object,
            unless the [FormatNilMapAsNull] option is specified.
        
          - A Go struct is encoded as a JSON object.
            See the “JSON Representation of Go structs” section
            in the package-level documentation for more details.
        
          - A Go slice is encoded as a JSON array, where each Go slice element
            is recursively JSON-encoded as the elements of the JSON array.
            By default, a nil slice is encoded as an empty JSON array,
            unless the [FormatNilSliceAsNull] option is specified.
        
          - A Go array is encoded as a JSON array, where each Go array element
            is recursively JSON-encoded as the elements of the JSON array.
            The JSON array length is always identical to the Go array length.
        
          - A Go pointer is encoded as a JSON null if nil, otherwise it is
            the recursively JSON-encoded representation of the underlying value.
        
          - A Go interface is encoded as a JSON null if nil, otherwise it is
            the recursively JSON-encoded representation of the underlying value.
        
          - A Go [time.Time] is encoded as a JSON string containing the timestamp
            formatted in RFC 3339 with nanosecond precision.
        
          - A Go [time.Duration] currently has no default representation and
            results in a [SemanticError], unless the [encoding/json.FormatDurationAsNano]
            option is specified, in which case it is encoded as a JSON number
            without fractions or exponents, representing the duration in nanoseconds.
        
          - All other Go types (e.g., complex numbers, channels, and functions)
            have no default representation and result in a [SemanticError].
        
        JSON cannot represent cyclic data structures and Marshal does not handle them.
    **/
    @:native("Marshal") static function marshal(_in: Dynamic, opts: haxe.Rest<go.encoding.json.v2.Options>): (go.Result<go.Slice<go.Byte>>);
    /**
        MarshalEncode serializes a Go value into an [jsontext.Encoder] according to
        the provided marshal or encode options (while ignoring unmarshal or decode options).
        The options provided take precedence over options already applied on
        the [jsontext.Encoder] and only apply for the duration of the marshal call.
        
        See [Marshal] for details about the conversion of a Go value into JSON.
    **/
    @:native("MarshalEncode") static function marshalEncode(out: go.Pointer<go.encoding.json.jsontext.Encoder>, _in: Dynamic, opts: haxe.Rest<go.encoding.json.v2.Options>): (go.Error);
    /**
        MarshalFunc constructs a type-specific marshaler that
        specifies how to marshal values of type T.
        T can be any type except a named pointer.
        The function is always provided with a non-nil pointer value
        if T is an interface or pointer type.
        
        Implementations must follow the requirements of [Marshaler].
        
        Implementations must not retain the value of T.
    **/
    @:native("MarshalFunc") static function marshalFunc<T: Dynamic>(fn: (p0: T) -> (go.Result<go.Slice<go.Byte>>)): (go.Pointer<go.encoding.json.v2.Marshalers>);
    /**
        MarshalToFunc constructs a type-specific marshaler that
        specifies how to marshal values of type T.
        T can be any type except a named pointer.
        The function is always provided with a non-nil pointer value
        if T is an interface or pointer type.
        
        Implementations must follow the requirements of [MarshalerTo].
        
        Implementations must not retain the pointer to [jsontext.Encoder] or the
        value of T.
    **/
    @:native("MarshalToFunc") static function marshalToFunc<T: Dynamic>(fn: (p0: go.Pointer<go.encoding.json.jsontext.Encoder>, p1: T) -> (go.Error)): (go.Pointer<go.encoding.json.v2.Marshalers>);
    /**
        MarshalWrite serializes a Go value into an [io.Writer] according to the provided
        marshal and encode options (while ignoring unmarshal or decode options).
        It does not terminate the output with a newline.
        See [Marshal] for details about the conversion of a Go value into JSON.
    **/
    @:native("MarshalWrite") static function marshalWrite(out: go.io.Writer, _in: Dynamic, opts: haxe.Rest<go.encoding.json.v2.Options>): (go.Error);
    /**
        MatchCaseInsensitiveNames specifies that JSON object members are matched
        against Go struct fields using a case-insensitive match of the name.
        If a name matches multiple fields, the field whose name matches exactly is chosen.
        If there is none, an error is reported.
        Go struct fields explicitly marked with `case:strict` or `case:ignore`
        always use case-sensitive (or case-insensitive) name matching,
        regardless of the value of this option.
        
        This affects either marshaling or unmarshaling.
        
        Matching names case-insensitively also affects duplicate name detection
        (assuming [jsontext.AllowDuplicateNames] is false) since
        variations of the same name may match the same Go struct field.
        For example, when unmarshaling, the names "foo" and "Foo" may both
        match the same Go struct field and therefore be considered a duplicate name.
        When marshaling, normally it is impossible for any two Go struct fields to
        serialize in a way where they unmarshal into the same Go struct field
        since they all have unique exact names.
        However, it is possible for an
        embedded fallback to contain a name that also matches the name for
        a Go struct field, resulting in a duplicate name error.
    **/
    @:native("MatchCaseInsensitiveNames") static function matchCaseInsensitiveNames(v: Bool): (go.encoding.json.v2.Options);
    /**
        OmitZeroStructFields specifies that zero-valued fields of Go struct should be
        omitted from the marshaled output.
        A value is considered zero if its type has an "IsZero() bool" method that returns true,
        or if it lacks such a method and the value is a Go zero value.
        This option is equivalent to specifying the `omitzero` tag option
        on every field in a Go struct.
        
        This only affects marshaling and is ignored when unmarshaling.
    **/
    @:native("OmitZeroStructFields") static function omitZeroStructFields(v: Bool): (go.encoding.json.v2.Options);
    /**
        RejectUnknownMembers specifies that unknown members should be rejected
        when unmarshaling a JSON object.
        
        This only affects unmarshaling and is ignored when marshaling.
    **/
    @:native("RejectUnknownMembers") static function rejectUnknownMembers(v: Bool): (go.encoding.json.v2.Options);
    /**
        StringifyNumbers specifies that types that would normally be
        encoded as a JSON number instead be encoded as a JSON string
        containing the equivalent JSON number value.
        When unmarshaling, the value is parsed from a JSON string
        containing the JSON number without any surrounding whitespace.
        
        Specifying the `string` tag option on a Go struct field applies this option
        to the top-level JSON value for that field. When applied via the `string`
        tag option, StringifyNumbers option does not recursively apply to nested
        JSON numbers within a JSON object or array.
        
        Like all options, explicitly specifying this option in a call to [Marshal],
        [Unmarshal], etc, will apply recursively.
        
        A Go type with custom marshal/unmarshal that represents a JSON number
        should respect the StringifyNumbers option and if specified
        serialize as a JSON number within a JSON string.
        Custom marshal/unmarshal should handle nested JSON objects using
        [MarshalEncode]/[UnmarshalDecode], which will automatically apply the
        non-recursive `string` tag option behavior.
        
        According to RFC 8259, section 6, a JSON implementation may choose to
        limit the representation of a JSON number to an IEEE 754 binary64 value.
        This may cause decoders to lose precision for int64 and uint64 types.
        Quoting JSON numbers as a JSON string preserves the exact precision.
        
        This affects either marshaling or unmarshaling.
    **/
    @:native("StringifyNumbers") static function stringifyNumbers(v: Bool): (go.encoding.json.v2.Options);
    /**
        Unmarshal decodes a []byte input into a Go value according to the provided
        unmarshal and decode options (while ignoring marshal or encode options).
        The input must be a single JSON value with optional whitespace interspersed.
        The output must be a non-nil pointer.
        
        Type-specific unmarshal functions and methods take precedence
        over the default representation of a value.
        Functions or methods that operate on *T are only called when decoding
        a value of type T (by taking its address) or a non-nil value of *T.
        Unmarshal ensures that a value is always addressable
        (by copying the value if necessary) so that
        these functions and methods can be consistently called.
        If a value must be shallow copied to call a pointer-receiver
        [Unmarshaler], [UnmarshalerFrom], or [encoding.TextUnmarshaler] method,
        then any mutations performed by the method are shallow copied back
        into the destination value.
        
        The input is decoded into the output according to the following rules:
        
          - If any type-specific functions in a [WithUnmarshalers] option match
            the value type, then those functions are called to decode the JSON
            value. If all applicable functions return [errors.ErrUnsupported],
            then the input is decoded according to subsequent rules.
        
          - If the value type implements [UnmarshalerFrom],
            then the UnmarshalJSONFrom method is called to decode the JSON value.
            If the method returns [errors.ErrUnsupported],
            then the input is decoded according to subsequent rules.
        
          - If the value type implements [Unmarshaler],
            then the UnmarshalJSON method is called to decode the JSON value.
        
          - If the value type implements [encoding.TextUnmarshaler],
            then the input is decoded as a JSON string and
            the UnmarshalText method is called with the decoded string value.
            This fails with a [SemanticError] if the input is not a JSON string.
        
          - Otherwise, the JSON value is decoded according to the value's type
            as described in detail below.
        
        Most Go types have a default JSON representation.
        A JSON null may be decoded into every supported Go value where
        it is equivalent to storing the zero value of the Go value.
        If the input JSON kind is not handled by the current Go value type,
        then this fails with a [SemanticError]. Unless otherwise specified,
        the decoded value replaces any pre-existing value.
        
        The representation of each type is as follows:
        
          - A Go boolean is decoded from a JSON boolean (e.g., true or false).
        
          - A Go string is decoded from a JSON string.
        
          - A Go []byte or [N]byte is decoded from a JSON string containing
            a binary value using Base 64 Encoding per RFC 4648, section 4.
            When decoding into a non-nil []byte, the slice length is reset to zero
            and the decoded input is appended to it.
            When decoding into a [N]byte, the input must decode to exactly N bytes,
            otherwise it fails with a [SemanticError].
        
          - A Go integer is decoded from a JSON number.
            It must be decoded from a JSON string containing a JSON number
            if [StringifyNumbers] is specified or decoding a JSON object name.
            It fails with a [SemanticError] if the JSON number
            has a fractional or exponent component.
            It also fails if it overflows the representation of the Go integer type.
        
          - A Go float is decoded from a JSON number.
            It must be decoded from a JSON string containing a JSON number
            if [StringifyNumbers] is specified or decoding a JSON object name.
            It fails if it overflows the representation of the Go float type.
            Since JSON lacks a native representation for a NaN or ±Inf,
            such values cannot be the result of decoding.
        
          - A Go map is decoded from a JSON object,
            where each JSON object name and value pair is recursively decoded
            as the Go map key and value. Maps are not cleared.
            If the Go map is nil, then a new map is allocated to decode into.
            If the decoded key matches an existing Go map entry, the entry value
            is reused by decoding the JSON object value into it.
        
          - A Go struct is decoded from a JSON object.
            See the “JSON Representation of Go structs” section
            in the package-level documentation for more details.
        
          - A Go slice is decoded from a JSON array, where each JSON element
            is recursively decoded and appended to the Go slice.
            Before appending into a Go slice, a new slice is allocated if it is nil,
            otherwise the slice length is reset to zero.
        
          - A Go array is decoded from a JSON array, where each JSON array element
            is recursively decoded as each corresponding Go array element.
            Each Go array element is zeroed before decoding into it.
            It fails with a [SemanticError] if the JSON array does not contain
            the exact same number of elements as the Go array.
        
          - A Go pointer is decoded based on the JSON kind and underlying Go type.
            If the input is a JSON null, then this stores a nil pointer.
            Otherwise, it allocates a new underlying value if the pointer is nil,
            and recursively JSON decodes into the underlying value.
        
          - A Go interface is decoded based on the JSON kind and underlying Go type.
            If the input is a JSON null, then this stores a nil interface value.
            Otherwise, a nil interface value of an empty interface type is initialized
            with a zero Go bool, string, float64, map[string]any, or []any if the
            input is a JSON boolean, string, number, object, or array, respectively.
            If the interface value is still nil, then this fails with a [SemanticError]
            since decoding could not determine an appropriate Go type to decode into.
            For example, unmarshaling into a nil io.Reader fails since
            there is no concrete type to populate the interface value with.
            Otherwise an underlying value exists and it recursively decodes
            the JSON input into it.
        
          - A Go [time.Time] is decoded from a JSON string containing the time
            formatted in RFC 3339 with nanosecond precision.
        
          - A Go [time.Duration] currently has no default representation and
            results in a [SemanticError], unless the [encoding/json.FormatDurationAsNano]
            option is specified, in which case it is decoded as a JSON number
            without fractions or exponents, representing the duration in nanoseconds.
        
          - All other Go types (e.g., complex numbers, channels, and functions)
            have no default representation and result in a [SemanticError].
        
        In general, unmarshaling follows merge semantics (similar to RFC 7396)
        where the decoded Go value replaces the destination value
        for any JSON kind other than an object.
        For JSON objects, the input object is merged into the destination value
        where matching object members recursively apply merge semantics.
    **/
    @:native("Unmarshal") static function unmarshal(_in: go.Slice<go.Byte>, out: Dynamic, opts: haxe.Rest<go.encoding.json.v2.Options>): (go.Error);
    /**
        UnmarshalDecode deserializes a Go value from a [jsontext.Decoder] according to
        the provided unmarshal or decode options (while ignoring marshal or encode options).
        The options provided take precedence over options already applied on
        the [jsontext.Decoder] and only apply for the duration of the unmarshal call.
        
        The input may be a stream of zero or more JSON values.
        UnmarshalDecode unmarshals only the next JSON value in the stream.
        If there are no more top-level JSON values, it reports [io.EOF].
        The output must be a non-nil pointer.
        See [Unmarshal] for details about the conversion of JSON into a Go value.
    **/
    @:native("UnmarshalDecode") static function unmarshalDecode(_in: go.Pointer<go.encoding.json.jsontext.Decoder>, out: Dynamic, opts: haxe.Rest<go.encoding.json.v2.Options>): (go.Error);
    /**
        UnmarshalFromFunc constructs a type-specific unmarshaler that
        specifies how to unmarshal values of type T.
        T must be an unnamed pointer or an interface type.
        The function is always provided with a non-nil pointer value.
        
        Implementations must follow the requirements of [UnmarshalerFrom].
        
        Implementations must not retain the pointer to [jsontext.Decoder] or the
        value of T.
    **/
    @:native("UnmarshalFromFunc") static function unmarshalFromFunc<T: Dynamic>(fn: (p0: go.Pointer<go.encoding.json.jsontext.Decoder>, p1: T) -> (go.Error)): (go.Pointer<go.encoding.json.v2.Unmarshalers>);
    /**
        UnmarshalFunc constructs a type-specific unmarshaler that
        specifies how to unmarshal values of type T.
        T must be an unnamed pointer or an interface type.
        The function is always provided with a non-nil pointer value.
        
        Implementations must follow the requirements of [Unmarshaler].
        
        Implementations must not retain the value of T.
    **/
    @:native("UnmarshalFunc") static function unmarshalFunc<T: Dynamic>(fn: (p0: go.Slice<go.Byte>, p1: T) -> (go.Error)): (go.Pointer<go.encoding.json.v2.Unmarshalers>);
    /**
        UnmarshalRead deserializes a Go value from an [io.Reader] according to the
        provided unmarshal and decode options (while ignoring marshal or encode options).
        The input must be a single JSON value with optional whitespace interspersed.
        It consumes the entirety of [io.Reader] until [io.EOF] is encountered,
        without reporting an error for EOF. The output must be a non-nil pointer.
        See [Unmarshal] for details about the conversion of JSON into a Go value.
    **/
    @:native("UnmarshalRead") static function unmarshalRead(_in: go.io.Reader, out: Dynamic, opts: haxe.Rest<go.encoding.json.v2.Options>): (go.Error);
    /**
        WithMarshalers specifies a list of type-specific marshalers to use,
        which can be used to override the default marshal behavior for values
        of particular types.
        
        This only affects marshaling and is ignored when unmarshaling.
    **/
    @:native("WithMarshalers") static function withMarshalers(v: go.Pointer<go.encoding.json.v2.Marshalers>): (go.encoding.json.v2.Options);
    /**
        WithUnmarshalers specifies a list of type-specific unmarshalers to use,
        which can be used to override the default unmarshal behavior for values
        of particular types.
        
        This only affects unmarshaling and is ignored when marshaling.
    **/
    @:native("WithUnmarshalers") static function withUnmarshalers(v: go.Pointer<go.encoding.json.v2.Unmarshalers>): (go.encoding.json.v2.Options);

}