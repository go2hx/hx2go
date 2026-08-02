package go.encoding.ascii85;

@:structInit
@:go.Type({ name: "encoder", instanceName: "ascii85.encoder", imports: ["encoding/ascii85"] })
extern class Encoder {

    @:native("Close") function close(): (go.Error);
    @:native("Write") function write(p: go.Slice<go.Byte>): (go.Result<go.GoInt>);

}