package go.io;

/**
    ReadSeeker is the interface that groups the basic Read and Seek methods.
**/
@:go.Type({ name: "ReadSeeker", instanceName: "io.ReadSeeker", imports: ["io"] })
extern typedef ReadSeeker = {

    @:native("Read") function read(p: go.Slice<go.Byte>): (go.Result<go.GoInt>);
    @:native("Seek") function seek(offset: go.Int64, whence: go.GoInt): (go.Result<go.Int64>);

}