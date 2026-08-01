package go.encoding.hex;

@:structInit
@:go.Type({ name: "encoder", instanceName: "hex.encoder", imports: ["encoding/hex"] })
extern class Encoder {

    @:native("Write") function write(p: go.Slice<go.Byte>): (go.Result<go.GoInt>);

}