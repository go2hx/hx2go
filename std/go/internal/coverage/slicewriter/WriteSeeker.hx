package go.internal.coverage.slicewriter;

@:structInit
@:go.Type({ name: "WriteSeeker", instanceName: "slicewriter.WriteSeeker", imports: ["internal/coverage/slicewriter"] })
extern class WriteSeeker {

    @:native("BytesWritten") function bytesWritten(): go.Slice<go.Byte>;
    @:native("Read") function read(p: go.Slice<go.Byte>): go.Result<go.GoInt>;
    @:native("Seek") function seek(offset: go.Int64, whence: go.GoInt): go.Result<go.Int64>;
    @:native("Write") function write(p: go.Slice<go.Byte>): go.Result<go.GoInt>;

}