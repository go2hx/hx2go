package go.testing;

@:structInit
@:go.Type({ name: "discard", instanceName: "testing.discard", imports: ["testing"] })
extern class Discard {

    @:native("Write") function write(b: go.Slice<go.Byte>): (go.Result<go.GoInt>);

}