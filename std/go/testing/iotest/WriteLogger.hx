package go.testing.iotest;

@:structInit
@:go.Type({ name: "writeLogger", instanceName: "iotest.writeLogger", imports: ["testing/iotest"] })
extern class WriteLogger {

    @:native("Write") function write(p: go.Slice<go.Byte>): (go.Result<go.GoInt>);

}