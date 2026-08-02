package go.encoding.base32;

@:structInit
@:go.Type({ name: "encoder", instanceName: "base32.encoder", imports: ["encoding/base32"] })
extern class Encoder {

    @:native("Close") function close(): (go.Error);
    @:native("Write") function write(p: go.Slice<go.Byte>): (go.Result<go.GoInt>);

}