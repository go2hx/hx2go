package go.io;

@:go.Type({ name: "ReadWriteCloser", instanceName: "io.ReadWriteCloser", imports: ["io"] })
extern typedef ReadWriteCloser = {

    @:native("Close") function close(): (go.Error);
    @:native("Read") function read(p: go.Slice<go.Byte>): (go.Result<go.GoInt>);
    @:native("Write") function write(p: go.Slice<go.Byte>): (go.Result<go.GoInt>);

}