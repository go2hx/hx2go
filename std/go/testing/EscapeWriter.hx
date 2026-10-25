package go.testing;

@:structInit
@:go.Type({ name: "escapeWriter", instanceName: "testing.escapeWriter", imports: ["testing"] })
extern class EscapeWriter {

    @:native("Write") function write(p: go.Slice<go.Byte>): (go.Result<go.GoInt>);
    @:native("WriteString") function writeString(s: String): (go.Result<go.GoInt>);

}