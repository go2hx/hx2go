package go.encoding.json.jsontext;

/**
    Value represents a single raw JSON value, which may be one of the following:
      - a JSON literal (i.e., null, true, or false)
      - a JSON string (e.g., "hello, world!")
      - a JSON number (e.g., 123.456)
      - an entire JSON object (e.g., {"fizz":"buzz"} )
      - an entire JSON array (e.g., [1,2,3] )
    
    Value can represent entire array or object values, while [Token] cannot.
    Value may contain leading and/or trailing whitespace.
**/
@:go.Type({ name: "Value", instanceName: "jsontext.Value", imports: ["encoding/json/jsontext"] })
extern class Value {

    /**
        Canonicalize canonicalizes the raw JSON value according to the
        JSON Canonicalization Scheme (JCS) as defined by RFC 8785.
        Canonicalization produces a JSON value with the same meaning as the original,
        but is stable in the sense that calling Canonicalize on a canonicalized
        value does nothing.
        
        JSON strings are formatted to use their minimal representation,
        JSON numbers are formatted as double precision numbers according
        to some stable serialization algorithm.
        JSON object members are sorted in ascending order by name.
        All whitespace is removed.
        
        Canonicalize is equivalent to calling [Value.Format] with the following options:
          - [CanonicalizeRawInts](true)
          - [CanonicalizeRawFloats](true)
          - [ReorderRawObjects](true)
        
        Any options specified by the caller are applied after the initial set
        and may deliberately override prior options.
        
        Note that JCS treats all JSON numbers as IEEE 754 double precision numbers.
        Any numbers with precision beyond what is representable by that form
        will lose their precision when canonicalized. For example, integer values
        beyond ±2⁵³ will lose their precision. To preserve the original representation
        of JSON integers, additionally set [CanonicalizeRawInts] to false:
        
        	v.Canonicalize(jsontext.CanonicalizeRawInts(false))
    **/
    @:native("Canonicalize") function canonicalize(opts: haxe.Rest<go.encoding.json.jsontext.Options>): (go.Error);
    /**
        Clone returns a copy of v.
    **/
    @:native("Clone") function clone(): (go.encoding.json.jsontext.Value);
    /**
        Compact removes all whitespace from the raw JSON value.
        
        It does not reformat JSON strings or numbers to use any other representation.
        To maximize the set of JSON values that can be formatted,
        it permits values with duplicate names and invalid UTF-8.
        
        Compact is equivalent to calling [Value.Format] with the following options:
          - [AllowDuplicateNames](true)
          - [AllowInvalidUTF8](true)
          - [PreserveRawStrings](true)
        
        Any options specified by the caller are applied after the initial set
        and may deliberately override prior options.
    **/
    @:native("Compact") function compact(opts: haxe.Rest<go.encoding.json.jsontext.Options>): (go.Error);
    /**
        Format formats the raw JSON value in place.
        
        By default (if no options are specified), it validates according to RFC 7493
        and produces the minimal JSON representation, where
        all whitespace is elided and JSON strings use the shortest encoding.
        
        Relevant options include:
          - [AllowDuplicateNames]
          - [AllowInvalidUTF8]
          - [EscapeForHTML]
          - [EscapeForJS]
          - [PreserveRawStrings]
          - [CanonicalizeRawInts]
          - [CanonicalizeRawFloats]
          - [ReorderRawObjects]
          - [SpaceAfterColon]
          - [SpaceAfterComma]
          - [Multiline]
          - [WithIndent]
          - [WithIndentPrefix]
        
        All other options are ignored.
        
        It is guaranteed to succeed if the value is valid according to the same options.
        If the value is already formatted, then the buffer is not mutated.
    **/
    @:native("Format") function format(opts: haxe.Rest<go.encoding.json.jsontext.Options>): (go.Error);
    /**
        Indent reformats the whitespace in the raw JSON value so that each element
        in a JSON object or array begins on an indented line according to the nesting.
        
        It does not reformat JSON strings or numbers to use any other representation.
        To maximize the set of JSON values that can be formatted,
        it permits values with duplicate names and invalid UTF-8.
        
        Indent is equivalent to calling [Value.Format] with the following options:
          - [AllowDuplicateNames](true)
          - [AllowInvalidUTF8](true)
          - [PreserveRawStrings](true)
          - [Multiline](true)
        
        Any options specified by the caller are applied after the initial set
        and may deliberately override prior options.
    **/
    @:native("Indent") function indent(opts: haxe.Rest<go.encoding.json.jsontext.Options>): (go.Error);
    /**
        IsValid reports whether the raw JSON value is syntactically valid
        according to the specified options.
        
        By default (if no options are specified), it validates according to RFC 7493.
        It verifies whether the input is properly encoded as UTF-8,
        that escape sequences within strings decode to valid Unicode codepoints, and
        that all names in each object are unique.
        It does not verify whether numbers are representable within the limits
        of any common numeric type (e.g., float64, int64, or uint64).
        
        Relevant options include:
          - [AllowDuplicateNames]
          - [AllowInvalidUTF8]
        
        All other options are ignored.
    **/
    @:native("IsValid") function isValid(opts: haxe.Rest<go.encoding.json.jsontext.Options>): (Bool);
    /**
        Kind returns the starting token kind.
        For a valid value, this will never include [KindEndObject] or [KindEndArray].
    **/
    @:native("Kind") function kind(): (go.encoding.json.jsontext.Kind);
    /**
        MarshalJSON returns v as the JSON encoding of v.
        It performs no validation.
        If v is nil, then this returns a JSON null.
    **/
    @:native("MarshalJSON") function marshalJSON(): (go.Result<go.Slice<go.Byte>>);
    /**
        String returns the string formatting of v.
    **/
    @:native("String") function string(): (std.String);
    /**
        UnmarshalJSON sets v as the JSON encoding of b.
        It stores a copy of the provided raw JSON input without any validation.
    **/
    @:native("UnmarshalJSON") function unmarshalJSON(b: go.Slice<go.Byte>): (go.Error);

}