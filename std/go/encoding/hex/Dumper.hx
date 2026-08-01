package go.encoding.hex;

@:structInit
@:go.Type({ name: "dumper", instanceName: "hex.dumper", imports: ["encoding/hex"] })
extern class Dumper {

    @:native("Close") function close(): (go.Error);
    @:native("Write") function write(data: go.Slice<go.Byte>): (go.Result<go.GoInt>);

}