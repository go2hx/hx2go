package go.io;

@:go.Type({ name: "ReadSeekCloser", instanceName: "io.ReadSeekCloser", imports: ["io"] })
extern typedef ReadSeekCloser = {

    @:native("Close") function close(): go.Error;
    @:native("Read") function read(p: go.Slice<go.Byte>): go.Result<go.GoInt>;
    @:native("Seek") function seek(offset: go.Int64, whence: go.GoInt): go.Result<go.Int64>;

}