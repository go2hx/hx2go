package go.testing;

@:structInit
@:go.Type({ name: "indenter", instanceName: "testing.indenter", imports: ["testing"] })
extern class Indenter {

    @:native("Write") function write(b: go.Slice<go.Byte>): (go.Result<go.GoInt>);

}