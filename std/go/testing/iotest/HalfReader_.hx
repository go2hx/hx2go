package go.testing.iotest;

@:structInit
@:go.Type({ name: "halfReader", instanceName: "iotest.halfReader", imports: ["testing/iotest"] })
extern class HalfReader_ {

    @:native("Read") function read(p: go.Slice<go.Byte>): (go.Result<go.GoInt>);

}