package go.io;

@:go.Type({ name: "ReadWriter", instanceName: "io.ReadWriter", imports: ["io"] })
extern typedef ReadWriter = {

    @:native("Read") function read(p: go.Slice<go.Byte>): (go.Result<go.GoInt>);
    @:native("Write") function write(p: go.Slice<go.Byte>): (go.Result<go.GoInt>);

}