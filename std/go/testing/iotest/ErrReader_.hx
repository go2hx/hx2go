package go.testing.iotest;

@:structInit
@:go.Type({ name: "errReader", instanceName: "iotest.errReader", imports: ["testing/iotest"] })
extern class ErrReader_ {

    @:native("Read") function read(p: go.Slice<go.Byte>): (go.Result<go.GoInt>);

}