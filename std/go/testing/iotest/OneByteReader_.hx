package go.testing.iotest;

@:structInit
@:go.Type({ name: "oneByteReader", instanceName: "iotest.oneByteReader", imports: ["testing/iotest"] })
extern class OneByteReader_ {

    @:native("Read") function read(p: go.Slice<go.Byte>): (go.Result<go.GoInt>);

}