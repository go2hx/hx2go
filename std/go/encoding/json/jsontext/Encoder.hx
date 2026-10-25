package go.encoding.json.jsontext;

/**
    Encoder is a streaming encoder to raw JSON tokens and values.
    It is used to write a stream of top-level JSON values,
    each terminated with a newline character.
    
    [Encoder.WriteToken] and [Encoder.WriteValue] calls may be interleaved.
    For example, the following JSON value:
    
    	{"name":"value","array":[null,false,true,3.14159],"object":{"k":"v"}}
    
    can be composed with the following calls (ignoring errors for brevity):
    
    	e.WriteToken(BeginObject)        // {
    	e.WriteToken(String("name"))     // "name"
    	e.WriteToken(String("value"))    // "value"
    	e.WriteValue(Value(`"array"`))   // "array"
    	e.WriteToken(BeginArray)         // [
    	e.WriteToken(Null)               // null
    	e.WriteToken(False)              // false
    	e.WriteValue(Value("true"))      // true
    	e.WriteToken(Float(3.14159))     // 3.14159
    	e.WriteToken(EndArray)           // ]
    	e.WriteValue(Value(`"object"`))  // "object"
    	e.WriteValue(Value(`{"k":"v"}`)) // {"k":"v"}
    	e.WriteToken(EndObject)          // }
    
    The above is one of many possible sequences of calls and
    may not represent the most sensible method to call for any given token/value.
    For example, it is probably more common to call [Encoder.WriteToken] with a string
    for object names.
**/
@:structInit
@:go.Type({ name: "Encoder", instanceName: "jsontext.Encoder", imports: ["encoding/json/jsontext"] })
extern class Encoder {

    /**
        AvailableBuffer returns a zero-length buffer with a possible non-zero capacity.
        This buffer is intended to be used to populate a [Value]
        being passed to an immediately succeeding [Encoder.WriteValue] call.
        
        Example usage:
        
        	b := e.AvailableBuffer()
        	b = append(b, '"')
        	b = appendString(b, v) // append the string formatting of v
        	b = append(b, '"')
        	... := e.WriteValue(b)
        
        Note that WriteValue expects a valid JSON value. Constructing a value in a
        raw []byte requires more care than using constructor functions like
        [String], which always return valid [Token]s or [Value]s.
    **/
    @:native("AvailableBuffer") function availableBuffer(): (go.Slice<go.Byte>);
    /**
        Options returns the options used to construct the encoder and
        may additionally contain semantic options passed to a
        [encoding/json/v2.MarshalEncode] call.
        
        If operating within
        a [encoding/json/v2.MarshalerTo.MarshalJSONTo] method call or
        a [encoding/json/v2.MarshalToFunc] function call,
        then the returned options are only valid within the call.
    **/
    @:native("Options") function options(): (go.encoding.json.jsontext.Options);
    /**
        OutputOffset returns the current output byte offset. It gives the location
        of the next byte immediately after the most recently written token or value.
        The number of bytes actually written to the underlying [io.Writer] may be less
        than this offset due to internal buffering.
    **/
    @:native("OutputOffset") function outputOffset(): (go.Int64);
    /**
        Reset resets an encoder such that it is writing afresh to w and
        configured with the provided options. Reset must not be called on
        an Encoder passed to the [encoding/json/v2.MarshalerTo.MarshalJSONTo] method
        or the [encoding/json/v2.MarshalToFunc] function.
    **/
    @:native("Reset") function reset(w: go.io.Writer, opts: haxe.Rest<go.encoding.json.jsontext.Options>): Void;
    /**
        StackDepth returns the depth of the state machine for written JSON data.
        Each level on the stack represents a nested JSON object or array.
        It is incremented whenever a [BeginObject] or [BeginArray] token is encountered
        and decremented whenever an [EndObject] or [EndArray] token is encountered.
        
        StackDepth returns 0 when not inside any object or array.
        In particular, it returns 0 before any tokens have been written,
        after any top-level value has been written, and between values
        when encoding a stream of top-level values (e.g., NDJSON).
        StackDepth returns 1 inside a top-level object or array,
        2 inside a nested object or array, and so on.
        
        For example, consider encoding the following JSON:
        
        	{"a": [1, 2], "b": {"c": 3}}
        
        While encoding, StackDepth would report the following:
        
          - At the start, StackDepth reports 0.
          - After encoding the outer '{', StackDepth reports 1.
          - After encoding the inner '[', StackDepth reports 2.
          - After encoding the inner ']', StackDepth reports 1.
          - After encoding the outer '}', StackDepth reports 0.
    **/
    @:native("StackDepth") function stackDepth(): (go.GoInt);
    /**
        StackIndex returns information about the specified stack level.
        It must be a number between 0 and [Encoder.StackDepth], inclusive.
        For each level, it reports the kind:
        
          - [KindInvalid] for a level of zero,
          - [KindBeginObject] for a level representing a JSON object, and
          - [KindBeginArray] for a level representing a JSON array.
        
        It also reports the length of that JSON object or array encoded so far.
        Each name and value in a JSON object is counted separately,
        so the effective number of members is half the length.
        A complete JSON object must have an even length.
    **/
    @:go.Tuple("p0", "p1") @:native("StackIndex") function stackIndex(i: go.GoInt): (go.Tuple<{ p0: go.encoding.json.jsontext.Kind, p1: go.Int64 }>);
    /**
        StackPointer returns a JSON Pointer (RFC 6901) to the most recently written value.
    **/
    @:native("StackPointer") function stackPointer(): (go.encoding.json.jsontext.Pointer);
    /**
        WriteToken writes the next token and advances the internal write offset.
        
        The provided token kind must be consistent with the JSON grammar.
        For example, it is an error to provide a number when the encoder
        is expecting an object name (which is always a string), or
        to provide an end object delimiter when the encoder is finishing an array.
        If the provided token is invalid, then WriteToken reports a [SyntacticError] and
        the internal state remains unchanged. The offset reported
        in [SyntacticError] will be the [Encoder.OutputOffset] plus any delimiter
        or whitespace characters that would have preceded the provided token.
    **/
    @:native("WriteToken") function writeToken(t: go.encoding.json.jsontext.Token): (go.Error);
    /**
        WriteValue writes the next raw value and advances the internal write offset.
        The Encoder does not simply copy the provided value verbatim, but
        parses it to ensure that it is syntactically valid and reformats it
        according to how the Encoder is configured to format whitespace and strings.
        If [AllowInvalidUTF8] is specified, then any invalid UTF-8 is mangled
        as the Unicode replacement character, U+FFFD.
        
        The provided value kind must be consistent with the JSON grammar
        (see examples on [Encoder.WriteToken]). If the provided value is invalid,
        then WriteValue reports a [SyntacticError] and the internal state remains unchanged.
        The offset reported in [SyntacticError] will be the [Encoder.OutputOffset]
        plus the offset into v of any encountered syntax error.
    **/
    @:native("WriteValue") function writeValue(v: go.encoding.json.jsontext.Value): (go.Error);

}