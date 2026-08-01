package go.testing.iotest;

@:structInit
@:go.Type({ name: "dataErrReader", instanceName: "iotest.dataErrReader", imports: ["testing/iotest"] })
extern class DataErrReader {

    @:native("Read") function read(p: go.Slice<go.Byte>): (go.Result<go.GoInt>);

}