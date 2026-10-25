package go.encoding.json.jsontext;

/**
    Token represents a lexical JSON token, which may be one of the following:
      - a JSON literal (i.e., null, true, or false)
      - a JSON string (e.g., "hello, world!")
      - a JSON number (e.g., 123.456)
      - a begin or end delimiter for a JSON object (i.e., { or } )
      - a begin or end delimiter for a JSON array (i.e., [ or ] )
    
    A Token cannot represent entire array or object values, while a [Value] can.
    There is no Token to represent commas and colons since
    these structural tokens can be inferred from the surrounding context.
    
    A Token stores data in one of two forms:
    
      - As raw JSON text: backed by the internal buffer of the [Decoder]
        and only ever produced by [Decoder.ReadToken].
        Such a token is only valid until the next call to any method on that
        [Decoder] (e.g., [Decoder.PeekKind], [Decoder.ReadToken],
        [Decoder.ReadValue], or [Decoder.SkipValue]).
        Call [Token.Clone] to copy the raw text into an independent allocation
        that persists beyond subsequent [Decoder] calls.
    
      - As a typed Go value: a self-contained representation produced by
        the constructor functions (e.g., [String], [Int], [Uint], [Float]).
        Such tokens are valid indefinitely and do not need to be cloned.
**/
@:structInit
@:go.Type({ name: "Token", instanceName: "jsontext.Token", imports: ["encoding/json/jsontext"] })
extern class Token {

    /**
        Bool returns the value for a JSON boolean.
        It panics if the token kind is not a JSON boolean.
    **/
    @:native("Bool") function bool(): (Bool);
    /**
        Clone returns a copy of the token with a value that is not backed by the
        [Decoder] buffer and therefore remains valid past subsequent [Decoder] calls.
        It has no effect on tokens produced by constructor functions,
        since those are already self-contained.
    **/
    @:native("Clone") function clone(): (go.encoding.json.jsontext.Token);
    /**
        Float returns the floating-point value for a JSON number
        parsed according to 64 bits of precision.
        
        If the JSON number is outside the representable range of a float64,
        it returns +Inf or -Inf along with an error
        that matches [strconv.ErrRange] according to [errors.Is].
        
        It returns a NaN, +Inf, or -Inf value for any JSON string
        with the values "NaN", "Infinity", or "-Infinity".
        
        It panics if the token kind is not a JSON number
        or a JSON string with the aforementioned values.
    **/
    @:native("Float") function float(): (go.Result<Float>);
    /**
        Float32 returns the floating-point value for a JSON number
        parsed according to 32 bits of precision.
        
        If the JSON number is outside the representable range of a float32,
        it returns +Inf or -Inf along with an error
        that matches [strconv.ErrRange] according to [errors.Is].
        
        It returns a NaN, +Inf, or -Inf value for any JSON string
        with the values "NaN", "Infinity", or "-Infinity".
        
        It panics if the token kind is not a JSON number
        or a JSON string with the aforementioned values.
        
        Note that most JSON libraries and standards assume that JSON numbers
        are 64-bit floating-point numbers.
        This method should only be used if the caller knows
        from other context that this token is a JSON number
        formatted only to 32 bits of precision (such as being encoded
        using the [Float32] constructor). For all other situations,
        prefer using the [Token.Float] accessor instead.
    **/
    @:native("Float32") function float32(): (go.Result<go.Float32>);
    /**
        Int returns the signed integer value for a JSON number.
        
        It reports an error that matches [strconv.ErrSyntax] according to [errors.Is]
        if the JSON number does not match the restricted grammar of just a signed integer.
        It reports an error that matches [strconv.ErrRange] according to [errors.Is]
        if the JSON number is a signed integer, but outside the range of an int64.
        Even if an error is reported, a reasonable value is still returned.
        The fractional component of any number is ignored (truncation toward zero).
        Any number beyond the representation of an int64 will be saturated
        to the closest representable value.
        
        It panics if the token kind is not a JSON number.
    **/
    @:native("Int") function int(): (go.Result<go.Int64>);
    /**
        Kind returns the token kind.
    **/
    @:native("Kind") function kind(): (go.encoding.json.jsontext.Kind);
    /**
        String returns the unescaped string value for a JSON string.
        For other JSON kinds, this returns the raw JSON representation.
    **/
    @:native("String") function string(): (std.String);
    /**
        Uint returns the unsigned integer value for a JSON number.
        
        It reports an error that matches [strconv.ErrSyntax] if the JSON number
        does not match the restricted grammar of just an unsigned integer.
        It reports an error that matches [strconv.ErrRange] if the JSON number
        is an unsigned integer, but outside the representable range of a uint64.
        Even if an error is reported, a reasonable value is still returned.
        The fractional component of any number is ignored (truncation toward zero).
        Any number beyond the representation of a uint64 will be saturated
        to the closest representable value.
        
        It panics if the token kind is not a JSON number.
    **/
    @:native("Uint") function uint(): (go.Result<go.UInt64>);

}