package go.encoding;

@:go.Type({ name: "xml", instanceName: "xml.xml", imports: ["encoding/xml"] })
extern class Xml {

    @:native("Header") static var Header: String;

    @:native("HTMLAutoClose") static var HTMLAutoClose: go.Slice<String>;
    @:native("HTMLEntity") static var HTMLEntity: go.Map<String, String>;

    @:native("CopyToken") static function copyToken(t: go.encoding.xml.Token): go.encoding.xml.Token;
    @:native("Escape") static function escape(w: go.io.Writer, s: go.Slice<go.Byte>): Void;
    @:native("EscapeText") static function escapeText(w: go.io.Writer, s: go.Slice<go.Byte>): go.Error;
    @:native("Marshal") static function marshal(v: Dynamic): go.Result<go.Slice<go.Byte>>;
    @:native("MarshalIndent") static function marshalIndent(v: Dynamic, prefix: String, indent: String): go.Result<go.Slice<go.Byte>>;
    @:native("NewDecoder") static function newDecoder(r: go.io.Reader): go.Pointer<go.encoding.xml.Decoder>;
    @:native("NewEncoder") static function newEncoder(w: go.io.Writer): go.Pointer<go.encoding.xml.Encoder>;
    @:native("NewTokenDecoder") static function newTokenDecoder(t: go.encoding.xml.TokenReader): go.Pointer<go.encoding.xml.Decoder>;
    @:native("Unmarshal") static function unmarshal(data: go.Slice<go.Byte>, v: Dynamic): go.Error;

}