package go.mime;

@:structInit
@:go.Type({ name: "WordDecoder", instanceName: "mime.WordDecoder", imports: ["mime"] })
extern class WordDecoder {

    @:native("CharsetReader") var charsetReader: (charset: String, input: go.io.Reader) -> go.Result<go.io.Reader>;

function new(charsetReader: (charset: String, input: go.io.Reader) -> go.Result<go.io.Reader>);

    @:native("Decode") function decode(word: String): go.Result<String>;
    @:native("DecodeHeader") function decodeHeader(header: String): go.Result<String>;

}