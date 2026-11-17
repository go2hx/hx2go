package go.encoding.json;

/**
    A Decoder reads and decodes JSON values from an input stream.
**/
@:structInit
@:go.Type({ name: "Decoder", instanceName: "json.Decoder", imports: ["encoding/json"] })
extern class Decoder {

    /**
        Buffered returns a reader of the data remaining in the Decoder's
        buffer. The reader is valid until the next call to [Decoder.Decode].
    **/
    @:native("Buffered") function buffered(): (go.io.Reader);
    /**
        Decode reads the next JSON-encoded value from its
        input and stores it in the value pointed to by v.
        
        See the documentation for [Unmarshal] for details about
        the conversion of JSON into a Go value.
    **/
    @:native("Decode") function decode(v: Dynamic): (go.Error);
    /**
        DisallowUnknownFields causes the Decoder to return an error when the destination
        is a struct and the input contains object keys which do not match any
        non-ignored, exported fields in the destination.
    **/
    @:native("DisallowUnknownFields") function disallowUnknownFields(): Void;
    /**
        InputOffset returns the input stream byte offset of the current decoder position.
        The offset gives the location of the end of the most recently returned token
        and the beginning of the next token.
    **/
    @:native("InputOffset") function inputOffset(): (go.Int64);
    /**
        More reports whether there is another element in the
        current array or object being parsed.
    **/
    @:native("More") function more(): (Bool);
    /**
        Token returns the next JSON token in the input stream.
        At the end of the input stream, Token returns nil, [io.EOF].
        
        Token guarantees that the delimiters [ ] { } it returns are
        properly nested and matched: if Token encounters an unexpected
        delimiter in the input, it will return an error.
        
        The input stream consists of basic JSON values—bool, string,
        number, and null—along with delimiters [ ] { } of type [Delim]
        to mark the start and end of arrays and objects.
        Commas and colons are elided.
    **/
    @:native("Token") function token(): (go.Result<go.encoding.json.Token>);
    /**
        UseNumber causes the Decoder to unmarshal a number into an
        interface value as a [Number] instead of as a float64.
    **/
    @:native("UseNumber") function useNumber(): Void;

}