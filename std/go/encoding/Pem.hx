package go.encoding;

@:go.Type({ name: "pem", instanceName: "pem.pem", imports: ["encoding/pem"] })
extern class Pem {

    @:go.Tuple("p", "rest") @:native("Decode") static function decode(data: go.Slice<go.Byte>): go.Tuple<{ p: go.Pointer<go.encoding.pem.Block>, rest: go.Slice<go.Byte> }>;
    @:native("Encode") static function encode(out: go.io.Writer, b: go.Pointer<go.encoding.pem.Block>): go.Error;
    @:native("EncodeToMemory") static function encodeToMemory(b: go.Pointer<go.encoding.pem.Block>): go.Slice<go.Byte>;

}