package go.encoding;

@:go.Type({ name: "hex", instanceName: "hex.hex", imports: ["encoding/hex"] })
extern class Hex {

    @:native("AppendDecode") static function appendDecode(dst: go.Slice<go.Byte>, src: go.Slice<go.Byte>): go.Result<go.Slice<go.Byte>>;
    @:native("AppendEncode") static function appendEncode(dst: go.Slice<go.Byte>, src: go.Slice<go.Byte>): go.Slice<go.Byte>;
    @:native("Decode") static function decode(dst: go.Slice<go.Byte>, src: go.Slice<go.Byte>): go.Result<go.GoInt>;
    @:native("DecodeString") static function decodeString(s: String): go.Result<go.Slice<go.Byte>>;
    @:native("DecodedLen") static function decodedLen(x: go.GoInt): go.GoInt;
    @:native("Dump") static function dump(data: go.Slice<go.Byte>): String;
    @:native("Dumper") static function dumper(w: go.io.Writer): go.io.WriteCloser;
    @:native("Encode") static function encode(dst: go.Slice<go.Byte>, src: go.Slice<go.Byte>): go.GoInt;
    @:native("EncodeToString") static function encodeToString(src: go.Slice<go.Byte>): String;
    @:native("EncodedLen") static function encodedLen(n: go.GoInt): go.GoInt;
    @:native("NewDecoder") static function newDecoder(r: go.io.Reader): go.io.Reader;
    @:native("NewEncoder") static function newEncoder(w: go.io.Writer): go.io.Writer;

}