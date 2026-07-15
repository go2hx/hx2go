package go.encoding;

@:go.Type({ name: "base32", instanceName: "base32.base32", imports: ["encoding/base32"] })
extern class Base32 {

    @:native("NoPadding") static var NoPadding: go.Rune;
    @:native("StdPadding") static var StdPadding: go.Rune;

    @:native("HexEncoding") static var HexEncoding: go.Pointer<go.encoding.base32.Encoding>;
    @:native("StdEncoding") static var StdEncoding: go.Pointer<go.encoding.base32.Encoding>;

    @:native("NewDecoder") static function newDecoder(enc: go.Pointer<go.encoding.base32.Encoding>, r: go.io.Reader): go.io.Reader;
    @:native("NewEncoder") static function newEncoder(enc: go.Pointer<go.encoding.base32.Encoding>, w: go.io.Writer): go.io.WriteCloser;
    @:native("NewEncoding") static function newEncoding(encoder: String): go.Pointer<go.encoding.base32.Encoding>;

}