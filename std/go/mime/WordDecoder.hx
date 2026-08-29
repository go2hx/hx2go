package go.mime;

/**
    A WordDecoder decodes MIME headers containing RFC 2047 encoded-words.
**/
@:structInit
@:go.Type({ name: "WordDecoder", instanceName: "mime.WordDecoder", imports: ["mime"] })
extern class WordDecoder {

    @:native("CharsetReader") var charsetReader: (charset: String, input: go.io.Reader) -> (go.Result<go.io.Reader>);

    function new(charsetReader: (charset: String, input: go.io.Reader) -> (go.Result<go.io.Reader>)=null);

    /**
        Decode decodes an RFC 2047 encoded-word.
    **/
    @:native("Decode") function decode(word: String): (go.Result<String>);
    /**
        DecodeHeader decodes all encoded-words of the given string. It returns an
        error if and only if [WordDecoder.CharsetReader] of d returns an error.
    **/
    @:native("DecodeHeader") function decodeHeader(header: String): (go.Result<String>);

}