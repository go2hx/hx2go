package go.testing.iotest;

@:structInit
@:go.Type({ name: "smallByteReader", instanceName: "iotest.smallByteReader", imports: ["testing/iotest"] })
extern class SmallByteReader {

    @:native("Read") function read(p: go.Slice<go.Byte>): (go.Result<go.GoInt>);

}