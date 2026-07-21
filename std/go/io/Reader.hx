package go.io;

@:go.Type({ name: "Reader", instanceName: "io.Reader", imports: ["io"] })
extern typedef Reader = {

    @:native("Read") function read(p: go.Slice<go.Byte>): (go.Result<go.GoInt>);

}