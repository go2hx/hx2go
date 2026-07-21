package go.io;

@:go.Type({ name: "WriteSeeker", instanceName: "io.WriteSeeker", imports: ["io"] })
extern typedef WriteSeeker = {

    @:native("Seek") function seek(offset: go.Int64, whence: go.GoInt): (go.Result<go.Int64>);
    @:native("Write") function write(p: go.Slice<go.Byte>): (go.Result<go.GoInt>);

}