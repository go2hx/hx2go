package go.encoding.ascii85;

@:structInit
@:go.Type({ name: "decoder", instanceName: "ascii85.decoder", imports: ["encoding/ascii85"] })
extern class Decoder {

    @:native("Read") function read(p: go.Slice<go.Byte>): (go.Result<go.GoInt>);

}