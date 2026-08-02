package go.testing.iotest;

@:structInit
@:go.Type({ name: "timeoutReader", instanceName: "iotest.timeoutReader", imports: ["testing/iotest"] })
extern class TimeoutReader {

    @:native("Read") function read(p: go.Slice<go.Byte>): (go.Result<go.GoInt>);

}