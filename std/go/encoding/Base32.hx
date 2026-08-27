package go.encoding;

@:go.Type({ name: "base32", instanceName: "base32.base32", imports: ["encoding/base32"] })
extern class Base32 {

    @:native("NoPadding") static var noPadding: go.Rune;
    @:native("StdPadding") static var stdPadding: go.Rune;

    @:native("HexEncoding") static var hexEncoding: go.Pointer<go.encoding.base32.Encoding>;
    @:native("StdEncoding") static var stdEncoding: go.Pointer<go.encoding.base32.Encoding>;

    @:native("NewDecoder") static function newDecoder(enc: go.Pointer<go.encoding.base32.Encoding>, r: go.io.Reader): (go.io.Reader);
    @:native("NewEncoder") static function newEncoder(enc: go.Pointer<go.encoding.base32.Encoding>, w: go.io.Writer): (go.io.WriteCloser);
    @:native("NewEncoding") static function newEncoding(encoder: String): (go.Pointer<go.encoding.base32.Encoding>);

}