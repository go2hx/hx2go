package go.testing.iotest;

@:structInit
@:go.Type({ name: "readLogger", instanceName: "iotest.readLogger", imports: ["testing/iotest"] })
extern class ReadLogger {

    @:native("Read") function read(p: go.Slice<go.Byte>): (go.Result<go.GoInt>);

}