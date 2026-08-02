package go.encoding.hex;

@:structInit
@:go.Type({ name: "decoder", instanceName: "hex.decoder", imports: ["encoding/hex"] })
extern class Decoder {

    @:native("Read") function read(p: go.Slice<go.Byte>): (go.Result<go.GoInt>);

}