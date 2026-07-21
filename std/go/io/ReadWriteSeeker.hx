package go.io;

@:go.Type({ name: "ReadWriteSeeker", instanceName: "io.ReadWriteSeeker", imports: ["io"] })
extern typedef ReadWriteSeeker = {

    @:native("Read") function read(p: go.Slice<go.Byte>): (go.Result<go.GoInt>);
    @:native("Seek") function seek(offset: go.Int64, whence: go.GoInt): (go.Result<go.Int64>);
    @:native("Write") function write(p: go.Slice<go.Byte>): (go.Result<go.GoInt>);

}