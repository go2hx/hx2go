package go.encoding.json.jsontext;

/**
    Decoder is a streaming decoder for raw JSON tokens and values.
    It is used to read a stream of top-level JSON values,
    each separated by optional whitespace characters.
    
    [Decoder.ReadToken] and [Decoder.ReadValue] calls may be interleaved.
    For example, the following JSON value:
    
    	{"name":"value","array":[null,false,true,3.14159],"object":{"k":"v"}}
    
    can be parsed with the following calls (ignoring errors for brevity):
    
    	d.ReadToken() // {
    	d.ReadToken() // "name"
    	d.ReadToken() // "value"
    	d.ReadValue() // "array"
    	d.ReadToken() // [
    	d.ReadToken() // null
    	d.ReadToken() // false
    	d.ReadValue() // true
    	d.ReadToken() // 3.14159
    	d.ReadToken() // ]
    	d.ReadValue() // "object"
    	d.ReadValue() // {"k":"v"}
    	d.ReadToken() // }
    
    The above is one of many possible sequences of calls and
    may not represent the most sensible method to call for any given token/value.
    For example, it is probably more common to call [Decoder.ReadToken] to obtain a
    string token for object names.
**/
@:structInit
@:go.Type({ name: "Decoder", instanceName: "jsontext.Decoder", imports: ["encoding/json/jsontext"] })
extern class Decoder {

    /**
        InputOffset returns the current input byte offset. It gives the location
        of the next byte immediately after the most recently returned token or value.
        The number of bytes actually read from the underlying [io.Reader] may be more
        than this offset due to internal buffering.
    **/
    @:native("InputOffset") function inputOffset(): (go.Int64);
    /**
        Options returns the options used to construct the decoder and
        may additionally contain semantic options passed to a
        [encoding/json/v2.UnmarshalDecode] call.
        
        If operating within
        a [encoding/json/v2.UnmarshalerFrom.UnmarshalJSONFrom] method call or
        a [encoding/json/v2.UnmarshalFromFunc] function call,
        then the returned options are only valid within the call.
    **/
    @:native("Options") function options(): (go.encoding.json.jsontext.Options);
    /**
        PeekKind retrieves the next token kind, but does not advance the read offset.
        
        It returns [KindInvalid] if an error occurs. Any such error is cached until
        the next read call and it is the caller's responsibility to eventually
        follow up a PeekKind call with a read call.
    **/
    @:native("PeekKind") function peekKind(): (go.encoding.json.jsontext.Kind);
    /**
        ReadToken reads the next [Token], advancing the read offset.
        The returned token is only valid until the next Peek, Read, or Skip call.
        It returns [io.EOF] if there are no more tokens.
    **/
    @:native("ReadToken") function readToken(): (go.Result<go.encoding.json.jsontext.Token>);
    /**
        ReadValue returns the next raw JSON value, advancing the read offset.
        The value is stripped of any leading or trailing whitespace and
        contains the exact bytes of the input, which may contain invalid UTF-8
        if [AllowInvalidUTF8] is specified.
        
        The returned value is only valid until the next Peek, Read, or Skip call and
        may not be mutated while the Decoder remains in use.
        If the decoder is currently at the end token for an object or array,
        then it reports a [SyntacticError] and the internal state remains unchanged.
        It returns [io.EOF] if there are no more values.
    **/
    @:native("ReadValue") function readValue(): (go.Result<go.encoding.json.jsontext.Value>);
    /**
        Reset resets a decoder such that it is reading afresh from r and
        configured with the provided options. Reset must not be called on
        a Decoder passed to the [encoding/json/v2.UnmarshalerFrom.UnmarshalJSONFrom] method
        or the [encoding/json/v2.UnmarshalFromFunc] function.
    **/
    @:native("Reset") function reset(r: go.io.Reader, opts: haxe.Rest<go.encoding.json.jsontext.Options>): Void;
    /**
        SkipValue is semantically equivalent to calling [Decoder.ReadValue] and discarding
        the result, except that memory is not wasted trying to hold the entire result.
    **/
    @:native("SkipValue") function skipValue(): (go.Error);
    /**
        StackDepth returns the depth of the state machine for JSON data
        that has already been read.
        Each level on the stack represents a nested JSON object or array.
        It is incremented whenever a [BeginObject] or [BeginArray] token is encountered
        and decremented whenever an [EndObject] or [EndArray] token is encountered.
        
        StackDepth returns 0 when not inside any object or array.
        In particular, it returns 0 before any tokens have been read,
        after any top-level value has been read, and between values
        when decoding a stream of top-level values (e.g., NDJSON).
        StackDepth returns 1 inside a top-level object or array,
        2 inside a nested object or array, and so on.
        
        For example, consider decoding the following JSON:
        
        	{"a": [1, 2], "b": {"c": 3}}
        
        While decoding, StackDepth would report the following:
        
          - At the start, StackDepth reports 0.
          - After decoding the outer '{', StackDepth reports 1.
          - After decoding the inner '[', StackDepth reports 2.
          - After decoding the inner ']', StackDepth reports 1.
          - After decoding the outer '}', StackDepth reports 0.
    **/
    @:native("StackDepth") function stackDepth(): (go.GoInt);
    /**
        StackIndex returns information about the specified stack level.
        It must be a number between 0 and [Decoder.StackDepth], inclusive.
        For each level, it reports the kind:
        
          - [KindInvalid] for a level of zero,
          - [KindBeginObject] for a level representing a JSON object, and
          - [KindBeginArray] for a level representing a JSON array.
        
        It also reports the length of that JSON object or array decoded so far.
        Each name and value in a JSON object is counted separately,
        so the effective number of members is half the length.
        A complete JSON object must have an even length.
    **/
    @:go.Tuple("p0", "p1") @:native("StackIndex") function stackIndex(i: go.GoInt): (go.Tuple<{ p0: go.encoding.json.jsontext.Kind, p1: go.Int64 }>);
    /**
        StackPointer returns a JSON Pointer (RFC 6901) to the most recently read value.
    **/
    @:native("StackPointer") function stackPointer(): (go.encoding.json.jsontext.Pointer);
    /**
        UnreadBuffer returns the data remaining in the unread buffer,
        which may contain zero or more bytes.
        This is the data already consumed from the input [io.Reader],
        but not yet read by a [Decoder.ReadToken] or [Decoder.ReadValue] call.
        It may contain bytes that do not form valid JSON, since it has not yet
        been validated according to the JSON grammar.
        The exact amount of buffered data is an implementation detail
        of the Decoder and may change over time.
        
        It is the caller's responsibility to concatenate this buffer with
        the remainder of the input Reader to obtain the full sequence
        of bytes after the last read JSON token or value.
        
        The returned buffer must not be mutated while Decoder continues to be used.
        The buffer contents are valid until the next Peek, Read, or Skip call.
    **/
    @:native("UnreadBuffer") function unreadBuffer(): (go.Slice<go.Byte>);

}