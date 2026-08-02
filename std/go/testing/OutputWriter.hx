package go.testing;

@:structInit
@:go.Type({ name: "outputWriter", instanceName: "testing.outputWriter", imports: ["testing"] })
extern class OutputWriter {

    @:native("Write") function write(p: go.Slice<go.Byte>): (go.Result<go.GoInt>);

}