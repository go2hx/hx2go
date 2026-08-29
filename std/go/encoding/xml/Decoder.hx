package go.encoding.xml;

/**
    A Decoder represents an XML parser reading a particular input stream.
    The parser assumes that its input is encoded in UTF-8.
**/
@:structInit
@:go.Type({ name: "Decoder", instanceName: "xml.Decoder", imports: ["encoding/xml"] })
extern class Decoder {

    @:native("Strict") var strict: Bool;
    @:native("AutoClose") var autoClose: go.Slice<String>;
    @:native("Entity") var entity: go.Map<String, String>;
    @:native("CharsetReader") var charsetReader: (charset: String, input: go.io.Reader) -> (go.Result<go.io.Reader>);
    @:native("DefaultSpace") var defaultSpace: String;

    function new(strict: Bool=false, autoClose: go.Slice<String>=null, entity: go.Map<String, String>=null, charsetReader: (charset: String, input: go.io.Reader) -> (go.Result<go.io.Reader>)=null, defaultSpace: String="");

    /**
        Decode works like [Unmarshal], except it reads the decoder
        stream to find the start element.
    **/
    @:native("Decode") function decode(v: Dynamic): (go.Error);
    /**
        DecodeElement works like [Unmarshal] except that it takes
        a pointer to the start XML element to decode into v.
        It is useful when a client reads some raw XML tokens itself
        but also wants to defer to [Unmarshal] for some elements.
    **/
    @:native("DecodeElement") function decodeElement(v: Dynamic, start: go.Pointer<go.encoding.xml.StartElement>): (go.Error);
    /**
        InputOffset returns the input stream byte offset of the current decoder position.
        The offset gives the location of the end of the most recently returned token
        and the beginning of the next token.
    **/
    @:native("InputOffset") function inputOffset(): (go.Int64);
    /**
        InputPos returns the line of the current decoder position and the 1 based
        input position of the line. The position gives the location of the end of the
        most recently returned token.
    **/
    @:go.Tuple("line", "column") @:native("InputPos") function inputPos(): (go.Tuple<{ line: go.GoInt, column: go.GoInt }>);
    /**
        RawToken is like [Decoder.Token] but does not verify that
        start and end elements match and does not translate
        name space prefixes to their corresponding URLs.
    **/
    @:native("RawToken") function rawToken(): (go.Result<go.encoding.xml.Token>);
    /**
        Skip reads tokens until it has consumed the end element
        matching the most recent start element already consumed,
        skipping nested structures.
        It returns nil if it finds an end element matching the start
        element; otherwise it returns an error describing the problem.
    **/
    @:native("Skip") function skip(): (go.Error);
    /**
        Token returns the next XML token in the input stream.
        At the end of the input stream, Token returns nil, [io.EOF].
        
        Slices of bytes in the returned token data refer to the
        parser's internal buffer and remain valid only until the next
        call to Token. To acquire a copy of the bytes, call [CopyToken]
        or the token's Copy method.
        
        Token expands self-closing elements such as <br>
        into separate start and end elements returned by successive calls.
        
        Token guarantees that the [StartElement] and [EndElement]
        tokens it returns are properly nested and matched:
        if Token encounters an unexpected end element
        or EOF before all expected end elements,
        it will return an error.
        
        If [Decoder.CharsetReader] is called and returns an error,
        the error is wrapped and returned.
        
        Token implements XML name spaces as described by
        https://www.w3.org/TR/REC-xml-names/. Each of the
        [Name] structures contained in the Token has the Space
        set to the URL identifying its name space when known.
        If Token encounters an unrecognized name space prefix,
        it uses the prefix as the Space rather than report an error.
    **/
    @:native("Token") function token(): (go.Result<go.encoding.xml.Token>);

}