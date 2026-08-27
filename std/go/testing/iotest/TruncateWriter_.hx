package go.testing.iotest;

@:structInit
@:go.Type({ name: "truncateWriter", instanceName: "iotest.truncateWriter", imports: ["testing/iotest"] })
extern class TruncateWriter_ {

    @:native("Write") function write(p: go.Slice<go.Byte>): (go.Result<go.GoInt>);

}