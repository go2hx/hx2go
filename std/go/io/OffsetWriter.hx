package go.io;

@:structInit
@:go.Type({ name: "OffsetWriter", instanceName: "io.OffsetWriter", imports: ["io"] })
extern class OffsetWriter {

    @:native("Seek") function seek(offset: go.Int64, whence: go.GoInt): go.Result<go.Int64>;
    @:native("Write") function write(p: go.Slice<go.Byte>): go.Result<go.GoInt>;
    @:native("WriteAt") function writeAt(p: go.Slice<go.Byte>, off: go.Int64): go.Result<go.GoInt>;

}