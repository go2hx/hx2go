package go.encoding.base64;

@:structInit
@:go.Type({ name: "encoder", instanceName: "base64.encoder", imports: ["encoding/base64"] })
extern class Encoder {

    @:native("Close") function close(): (go.Error);
    @:native("Write") function write(p: go.Slice<go.Byte>): (go.Result<go.GoInt>);

}