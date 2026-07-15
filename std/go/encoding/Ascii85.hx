package go.encoding;

@:go.Type({ name: "ascii85", instanceName: "ascii85.ascii85", imports: ["encoding/ascii85"] })
extern class Ascii85 {

    @:go.Tuple("ndst", "nsrc", "err") @:native("Decode") static function decode(dst: go.Slice<go.Byte>, src: go.Slice<go.Byte>, flush: Bool): go.Tuple<{ ndst: go.GoInt, nsrc: go.GoInt, err: go.Error }>;
    @:native("Encode") static function encode(dst: go.Slice<go.Byte>, src: go.Slice<go.Byte>): go.GoInt;
    @:native("MaxEncodedLen") static function maxEncodedLen(n: go.GoInt): go.GoInt;
    @:native("NewDecoder") static function newDecoder(r: go.io.Reader): go.io.Reader;
    @:native("NewEncoder") static function newEncoder(w: go.io.Writer): go.io.WriteCloser;

}