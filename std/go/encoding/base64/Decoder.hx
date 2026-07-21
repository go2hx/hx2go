package go.encoding.base64;

@:structInit
@:go.Type({ name: "decoder", instanceName: "base64.decoder", imports: ["encoding/base64"] })
extern class Decoder {

    @:native("Read") function read(p: go.Slice<go.Byte>): (go.Result<go.GoInt>);

}