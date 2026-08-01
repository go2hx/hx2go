package go.net.textproto;

@:structInit
@:go.Type({ name: "dotWriter", instanceName: "textproto.dotWriter", imports: ["net/textproto"] })
extern class DotWriter {

    @:native("Close") function close(): (go.Error);
    @:native("Write") function write(b: go.Slice<go.Byte>): (go.Result<go.GoInt>);

}