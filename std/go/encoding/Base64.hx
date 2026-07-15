package go.encoding;

@:go.Type({ name: "base64", instanceName: "base64.base64", imports: ["encoding/base64"] })
extern class Base64 {

    @:native("NoPadding") static var NoPadding: go.Rune;
    @:native("StdPadding") static var StdPadding: go.Rune;

    @:native("RawStdEncoding") static var RawStdEncoding: go.Pointer<go.encoding.base64.Encoding>;
    @:native("RawURLEncoding") static var RawURLEncoding: go.Pointer<go.encoding.base64.Encoding>;
    @:native("StdEncoding") static var StdEncoding: go.Pointer<go.encoding.base64.Encoding>;
    @:native("URLEncoding") static var URLEncoding: go.Pointer<go.encoding.base64.Encoding>;

    @:native("NewDecoder") static function newDecoder(enc: go.Pointer<go.encoding.base64.Encoding>, r: go.io.Reader): go.io.Reader;
    @:native("NewEncoder") static function newEncoder(enc: go.Pointer<go.encoding.base64.Encoding>, w: go.io.Writer): go.io.WriteCloser;
    @:native("NewEncoding") static function newEncoding(encoder: String): go.Pointer<go.encoding.base64.Encoding>;

}