package go.net.textproto;

@:structInit
@:go.Type({ name: "dotReader", instanceName: "textproto.dotReader", imports: ["net/textproto"] })
extern class DotReader {

    @:native("Read") function read(b: go.Slice<go.Byte>): (go.Result<go.GoInt>);

}