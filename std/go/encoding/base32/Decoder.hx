package go.encoding.base32;

@:structInit
@:go.Type({ name: "decoder", instanceName: "base32.decoder", imports: ["encoding/base32"] })
extern class Decoder {

    @:native("Read") function read(p: go.Slice<go.Byte>): (go.Result<go.GoInt>);

}