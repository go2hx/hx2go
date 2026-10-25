package go.encoding.json;

/**
    Package jsontext implements syntactic processing of JSON
    as specified in RFC 4627, RFC 7159, RFC 7493, RFC 8259, and RFC 8785.
    JSON is a simple data interchange format that can represent
    primitive data types such as booleans, strings, and numbers,
    in addition to structured data types such as objects and arrays.
    
    The [Encoder] and [Decoder] types are used to encode or decode
    a stream of JSON tokens or values.
    
    # Tokens and Values
    
    A JSON token refers to the basic structural elements of JSON:
    
      - a JSON literal (i.e., null, true, or false)
      - a JSON string (e.g., "hello, world!")
      - a JSON number (e.g., 123.456)
      - a begin or end delimiter for a JSON object (i.e., '{' or '}')
      - a begin or end delimiter for a JSON array (i.e., '[' or ']')
    
    A JSON token is represented by the [Token] type in Go. Technically,
    there are two additional structural characters (i.e., ':' and ','),
    but there is no [Token] representation for them since their presence
    can be inferred by the structure of the JSON grammar itself.
    For example, there must always be an implicit colon between
    the name and value of a JSON object member.
    
    A JSON value refers to a complete unit of JSON data:
    
      - a JSON literal, string, or number
      - a JSON object (e.g., `{"name":"value"}`)
      - a JSON array (e.g., `[1,2,3]`)
    
    A JSON value is represented by the [Value] type in Go and is a []byte
    containing the raw textual representation of the value. There is some overlap
    between tokens and values as both contain literals, strings, and numbers.
    However, only a value can represent the entirety of a JSON object or array.
    
    The [Encoder] and [Decoder] types contain methods to read or write the next
    [Token] or [Value] in a sequence. They maintain a state machine to validate
    whether the sequence of JSON tokens and/or values produces valid JSON.
    [Options] may be passed to the [NewEncoder] or [NewDecoder] constructors
    to configure the behavior of encoding and decoding.
    
    # Terminology
    
    The terms "encode" and "decode" are used for syntactic functionality
    that is concerned with processing JSON based on its grammar, and
    the terms "marshal" and "unmarshal" are used for semantic functionality
    that determines the meaning of JSON values as Go values and vice versa.
    This package deals with JSON syntax,
    while [encoding/json/v2] deals with JSON semantics.
    The goal is to provide a clear distinction between functionality that
    is purely concerned with encoding versus that of marshaling.
    For example, one can directly encode a stream of JSON tokens without
    needing to marshal a concrete Go value representing them.
    Similarly, one can decode a stream of JSON tokens without
    needing to unmarshal them into a concrete Go value.
    
    This package uses JSON terminology when discussing JSON, which may differ
    from related concepts in Go or elsewhere in computing literature.
    
      - a JSON "object" refers to an unordered collection of name/value members.
      - a JSON "array" refers to an ordered sequence of elements.
      - a JSON "value" refers to either a literal (i.e., null, false, or true),
        string, number, object, or array.
    
    See RFC 8259 for more information.
    
    # Specifications
    
    Relevant specifications include RFC 4627, RFC 7159, RFC 7493, RFC 8259,
    and RFC 8785. Each RFC is generally a stricter subset of another RFC.
    In increasing order of strictness:
    
      - RFC 4627 and RFC 7159 do not require (but recommend) the use of UTF-8
        and also do not require (but recommend) that object names be unique.
      - RFC 8259 requires the use of UTF-8,
        but does not require (but recommends) that object names be unique.
      - RFC 7493 requires the use of UTF-8
        and also requires that object names be unique.
      - RFC 8785 defines a canonical representation. It requires the use of UTF-8
        and also requires that object names be unique and in a specific ordering.
        It specifies exactly how strings and numbers must be formatted.
    
    The primary difference between RFC 4627 and RFC 7159 is that the former
    restricted top-level values to only JSON objects and arrays, while
    RFC 7159 and subsequent RFCs permit top-level values to additionally be
    JSON nulls, booleans, strings, or numbers.
    
    By default, this package operates on RFC 7493, but can be configured
    to operate according to the other RFC specifications.
    RFC 7493 is a stricter subset of RFC 8259 and fully compliant with it.
    In particular, it makes specific choices about behavior that RFC 8259
    leaves as undefined in order to ensure greater interoperability.
    
    # Security Considerations
    
    See the "Security Considerations" section in [encoding/json/v2].
**/
@:go.Type({ name: "jsontext", instanceName: "jsontext.jsontext", imports: ["encoding/json/jsontext"] })
extern class Jsontext {

    @:native("KindBeginArray") static var kindBeginArray: go.encoding.json.jsontext.Kind;
    @:native("KindBeginObject") static var kindBeginObject: go.encoding.json.jsontext.Kind;
    @:native("KindEndArray") static var kindEndArray: go.encoding.json.jsontext.Kind;
    @:native("KindEndObject") static var kindEndObject: go.encoding.json.jsontext.Kind;
    @:native("KindFalse") static var kindFalse: go.encoding.json.jsontext.Kind;
    @:native("KindInvalid") static var kindInvalid: go.encoding.json.jsontext.Kind;
    @:native("KindNull") static var kindNull: go.encoding.json.jsontext.Kind;
    @:native("KindNumber") static var kindNumber: go.encoding.json.jsontext.Kind;
    @:native("KindString") static var kindString: go.encoding.json.jsontext.Kind;
    @:native("KindTrue") static var kindTrue: go.encoding.json.jsontext.Kind;

    @:native("BeginArray") static var beginArray: go.encoding.json.jsontext.Token;
    @:native("BeginObject") static var beginObject: go.encoding.json.jsontext.Token;
    @:native("EndArray") static var endArray: go.encoding.json.jsontext.Token;
    @:native("EndObject") static var endObject: go.encoding.json.jsontext.Token;
    @:native("False") static var _false: go.encoding.json.jsontext.Token;
    /**
        Internal is for internal use only.
        This is exempt from the Go compatibility agreement.
    **/
    @:native("Internal") static var internal: go.encoding.json.jsontext.Exporter;
    @:native("Null") static var _null: go.encoding.json.jsontext.Token;
    @:native("True") static var _true: go.encoding.json.jsontext.Token;

    /**
        AllowDuplicateNames specifies that JSON objects may contain
        duplicate member names. Disabling the duplicate name check may provide
        performance benefits, but breaks compliance with RFC 7493, section 2.3.
        The input or output will still be compliant with RFC 8259,
        which leaves the handling of duplicate names as unspecified behavior.
        
        This affects either encoding or decoding.
    **/
    @:native("AllowDuplicateNames") static function allowDuplicateNames(v: Bool): (go.encoding.json.jsontext.Options);
    /**
        AllowInvalidUTF8 specifies that JSON strings may contain invalid UTF-8,
        which will be mangled as the Unicode replacement character, U+FFFD.
        This causes the encoder or decoder to break compliance with
        RFC 7493, section 2.1, and RFC 8259, section 8.1.
        
        This affects either encoding or decoding.
    **/
    @:native("AllowInvalidUTF8") static function allowInvalidUTF8(v: Bool): (go.encoding.json.jsontext.Options);
    /**
        AppendFloat appends src to dst as a JSON number per RFC 8259, section 6.
        
        Except for -0, which is formatted as -0 instead of 0,
        the output is identical to ECMA-262, 10th edition, section 7.1.12.1
        and (for 64-bit precision) identical to RFC 8785, section 3.2.2.3.
        The values NaN, +Inf, and -Inf will be represented as a JSON string
        with the values "NaN", "Infinity", and "-Infinity".
        
        Note that most JSON libraries and standards assume that JSON numbers
        are 64-bit floating-point numbers. As such, prefer using 64 bits
        of precision unless the recipient can know from other context
        that the encoded number uses 32 bits of precision.
    **/
    @:native("AppendFloat") static function appendFloat(dst: go.Slice<go.Byte>, src: Float, bits: go.GoInt): (go.Slice<go.Byte>);
    /**
        AppendFormat formats the JSON value in src and appends it to dst
        according to the specified options.
        See [Value.Format] for more details about the formatting behavior.
        
        The dst and src may overlap.
        If an error is reported, then the entirety of src is appended to dst.
    **/
    @:native("AppendFormat") static function appendFormat<Bytes: Dynamic>(dst: go.Slice<go.Byte>, src: Bytes, opts: haxe.Rest<go.encoding.json.jsontext.Options>): (go.Result<go.Slice<go.Byte>>);
    /**
        AppendQuote appends a double-quoted JSON string literal representing src
        to dst and returns the extended buffer.
        It uses the minimal string representation per RFC 8785, section 3.2.2.2.
        Invalid UTF-8 bytes are replaced with the Unicode replacement character
        and an error is returned at the end indicating the presence of invalid UTF-8.
        The dst must not overlap with the src.
    **/
    @:native("AppendQuote") static function appendQuote<Bytes: Dynamic>(dst: go.Slice<go.Byte>, src: Bytes): (go.Result<go.Slice<go.Byte>>);
    /**
        AppendUnquote appends the decoded interpretation of src as a
        double-quoted JSON string literal to dst and returns the extended buffer.
        The input src must be a JSON string without any surrounding whitespace.
        Invalid UTF-8 bytes are replaced with the Unicode replacement character
        and an error is returned at the end indicating the presence of invalid UTF-8.
        Any trailing bytes after the JSON string literal results in an error.
        The dst must not overlap with the src.
    **/
    @:native("AppendUnquote") static function appendUnquote<Bytes: Dynamic>(dst: go.Slice<go.Byte>, src: Bytes): (go.Result<go.Slice<go.Byte>>);
    /**
        Bool constructs a Token representing a JSON boolean.
    **/
    @:native("Bool") static function bool(b: Bool): (go.encoding.json.jsontext.Token);
    /**
        CanonicalizeRawFloats specifies that when encoding a raw JSON
        floating-point number (i.e., a number with a fraction or exponent) in a
        [Token] or [Value], the number is canonicalized
        according to RFC 8785, section 3.2.2.3. As a special case,
        the number -0 is canonicalized as 0.
        
        JSON numbers are treated as IEEE 754 double precision numbers.
        It is safe to canonicalize a serialized single precision number and
        parse it back as a single precision number and expect the same value.
        If a number exceeds ±1.7976931348623157e+308, which is the maximum
        finite number, then it is saturated at that value and formatted as such.
        
        This only affects encoding and is ignored when decoding.
    **/
    @:native("CanonicalizeRawFloats") static function canonicalizeRawFloats(v: Bool): (go.encoding.json.jsontext.Options);
    /**
        CanonicalizeRawInts specifies that when encoding a raw JSON
        integer number (i.e., a number without a fraction and exponent) in a
        [Token] or [Value], the number is canonicalized
        according to RFC 8785, section 3.2.2.3. As a special case,
        the number -0 is canonicalized as 0.
        
        JSON numbers are treated as IEEE 754 double precision numbers.
        Any numbers with precision beyond what is representable by that form
        will lose their precision when canonicalized. For example,
        integer values beyond ±2⁵³ will lose their precision.
        For example, 1234567890123456789 is formatted as 1234567890123456800.
        
        This only affects encoding and is ignored when decoding.
    **/
    @:native("CanonicalizeRawInts") static function canonicalizeRawInts(v: Bool): (go.encoding.json.jsontext.Options);
    /**
        EscapeForHTML specifies that '<', '>', and '&' characters within JSON strings
        should be escaped as a hexadecimal Unicode codepoint (e.g., \u003c) so that
        the output is safe to embed within HTML.
        
        This only affects encoding and is ignored when decoding.
    **/
    @:native("EscapeForHTML") static function escapeForHTML(v: Bool): (go.encoding.json.jsontext.Options);
    /**
        EscapeForJS specifies that U+2028 and U+2029 characters within JSON strings
        should be escaped as a hexadecimal Unicode codepoint (e.g., \u2028) so that
        the output is valid to embed within JavaScript. See RFC 8259, section 12.
        
        This only affects encoding and is ignored when decoding.
    **/
    @:native("EscapeForJS") static function escapeForJS(v: Bool): (go.encoding.json.jsontext.Options);
    /**
        Float constructs a Token representing a JSON number as
        a 64-bit floating-point number formatted according to
        ECMA-262, 10th edition, section 7.1.12.1 and RFC 8785, section 3.2.2.3.
        with the exception that -0 is still formatted as -0.
        The values NaN, +Inf, and -Inf will be represented
        as a JSON string with the values "NaN", "Infinity", and "-Infinity".
    **/
    @:native("Float") static function float(n: Float): (go.encoding.json.jsontext.Token);
    /**
        Float32 constructs a Token representing a JSON number as
        a 32-bit floating-point number formatted according to
        ECMA-262, 10th edition, section 7.1.12.1,
        with the exception that -0 is still formatted as -0.
        The values NaN, +Inf, and -Inf will be represented
        as a JSON string with the values "NaN", "Infinity", and "-Infinity".
        
        Note that most JSON libraries and standards assume that JSON numbers
        are 64-bit floating-point numbers. Use of 32-bit precision should
        only be used if the corresponding decoder knows that
        this JSON number token is expected to only have 32-bit precision.
        For all other situations, prefer using the [Float] constructor instead.
    **/
    @:native("Float32") static function float32(n: go.Float32): (go.encoding.json.jsontext.Token);
    /**
        Int constructs a Token representing a JSON number from an int64.
    **/
    @:native("Int") static function int(n: go.Int64): (go.encoding.json.jsontext.Token);
    /**
        Multiline specifies that the JSON output should expand to multiple lines,
        where every JSON object member or JSON array element appears on
        a new, indented line according to the nesting depth.
        
        If [SpaceAfterColon] is not specified, then the default is true.
        If [SpaceAfterComma] is not specified, then the default is false.
        If [WithIndent] is not specified, then the default is "\t".
        
        If set to false, then the output is a single line,
        where the only whitespace emitted is determined by the current
        values of [SpaceAfterColon] and [SpaceAfterComma].
        
        This only affects encoding and is ignored when decoding.
    **/
    @:native("Multiline") static function multiline(v: Bool): (go.encoding.json.jsontext.Options);
    /**
        NewDecoder constructs a new streaming decoder reading from r.
        
        If r is a [bytes.Buffer], then the decoder parses directly from the buffer
        without first copying the contents to an intermediate buffer.
        Additional writes to the buffer must not occur while the decoder is in use.
    **/
    @:native("NewDecoder") static function newDecoder(r: go.io.Reader, opts: haxe.Rest<go.encoding.json.jsontext.Options>): (go.Pointer<go.encoding.json.jsontext.Decoder>);
    /**
        NewEncoder constructs a new streaming encoder writing to w
        configured with the provided options.
        It flushes the internal buffer when the buffer is sufficiently full or
        when a top-level value has been written.
        
        If w is a [bytes.Buffer], then the encoder appends directly into the buffer
        without copying the contents from an intermediate buffer.
    **/
    @:native("NewEncoder") static function newEncoder(w: go.io.Writer, opts: haxe.Rest<go.encoding.json.jsontext.Options>): (go.Pointer<go.encoding.json.jsontext.Encoder>);
    /**
        PreserveRawStrings specifies that when encoding a raw JSON string in a
        [Token] or [Value], pre-escaped sequences
        in a JSON string are preserved to the output.
        However, raw strings still respect [EscapeForHTML] and [EscapeForJS]
        such that the relevant characters are escaped.
        If [AllowInvalidUTF8] is enabled, bytes of invalid UTF-8
        are preserved to the output.
        
        This only affects encoding and is ignored when decoding.
    **/
    @:native("PreserveRawStrings") static function preserveRawStrings(v: Bool): (go.encoding.json.jsontext.Options);
    /**
        ReorderRawObjects specifies that when encoding a raw JSON object in a
        [Value], the object members are reordered according to
        RFC 8785, section 3.2.3.
        
        This only affects encoding and is ignored when decoding.
    **/
    @:native("ReorderRawObjects") static function reorderRawObjects(v: Bool): (go.encoding.json.jsontext.Options);
    /**
        SpaceAfterColon specifies that the JSON output should emit a space character
        after each colon separator following a JSON object name.
        If false, then no space character appears after the colon separator.
        
        This only affects encoding and is ignored when decoding.
    **/
    @:native("SpaceAfterColon") static function spaceAfterColon(v: Bool): (go.encoding.json.jsontext.Options);
    /**
        SpaceAfterComma specifies that the JSON output should emit a space character
        after each comma separator following a JSON object value or array element.
        If false, then no space character appears after the comma separator.
        
        This only affects encoding and is ignored when decoding.
    **/
    @:native("SpaceAfterComma") static function spaceAfterComma(v: Bool): (go.encoding.json.jsontext.Options);
    /**
        String constructs a Token representing a JSON string.
        The provided string should contain valid UTF-8, otherwise invalid characters
        may be mangled as the Unicode replacement character.
    **/
    @:native("String") static function string(s: std.String): (go.encoding.json.jsontext.Token);
    /**
        Uint constructs a Token representing a JSON number from a uint64.
    **/
    @:native("Uint") static function uint(n: go.UInt64): (go.encoding.json.jsontext.Token);
    /**
        WithIndent specifies that the encoder should emit multiline output
        where each element in a JSON object or array begins on a new, indented line
        beginning with the indent prefix (see [WithIndentPrefix])
        followed by one or more copies of indent according to the nesting depth.
        The indent must be composed of only space and tab characters.
        
        If the intent is to emit indented output without a preference for
        the particular indent string, then use [Multiline] instead.
        
        This only affects encoding and is ignored when decoding.
        Use of this option implies [Multiline] being set to true.
    **/
    @:native("WithIndent") static function withIndent(indent: std.String): (go.encoding.json.jsontext.Options);
    /**
        WithIndentPrefix specifies that the encoder should emit multiline output
        where each element in a JSON object or array begins on a new, indented line
        beginning with the indent prefix followed by one or more copies of indent
        (see [WithIndent]) according to the nesting depth.
        The prefix must be composed of only space and tab characters.
        
        This only affects encoding and is ignored when decoding.
        Use of this option implies [Multiline] being set to true.
    **/
    @:native("WithIndentPrefix") static function withIndentPrefix(prefix: std.String): (go.encoding.json.jsontext.Options);

}