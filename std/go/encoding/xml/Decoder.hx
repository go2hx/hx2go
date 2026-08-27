package go.encoding.xml;

@:structInit
@:go.Type({ name: "Decoder", instanceName: "xml.Decoder", imports: ["encoding/xml"] })
extern class Decoder {

    @:native("Strict") var strict: Bool;
    @:native("AutoClose") var autoClose: go.Slice<String>;
    @:native("Entity") var entity: go.Map<String, String>;
    @:native("CharsetReader") var charsetReader: (charset: String, input: go.io.Reader) -> (go.Result<go.io.Reader>);
    @:native("DefaultSpace") var defaultSpace: String;

    function new(strict: Bool=false, autoClose: go.Slice<String>=null, entity: go.Map<String, String>=null, charsetReader: (charset: String, input: go.io.Reader) -> (go.Result<go.io.Reader>)=null, defaultSpace: String="");

    @:native("Decode") function decode(v: Dynamic): (go.Error);
    @:native("DecodeElement") function decodeElement(v: Dynamic, start: go.Pointer<go.encoding.xml.StartElement>): (go.Error);
    @:native("InputOffset") function inputOffset(): (go.Int64);
    @:go.Tuple("line", "column") @:native("InputPos") function inputPos(): (go.Tuple<{ line: go.GoInt, column: go.GoInt }>);
    @:native("RawToken") function rawToken(): (go.Result<go.encoding.xml.Token>);
    @:native("Skip") function skip(): (go.Error);
    @:native("Token") function token(): (go.Result<go.encoding.xml.Token>);

}