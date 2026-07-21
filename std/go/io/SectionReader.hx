package go.io;

@:structInit
@:go.Type({ name: "SectionReader", instanceName: "io.SectionReader", imports: ["io"] })
extern class SectionReader {

    @:go.Tuple("r", "off", "n") @:native("Outer") function outer(): (go.Tuple<{ r: go.io.ReaderAt, off: go.Int64, n: go.Int64 }>);
    @:native("Read") function read(p: go.Slice<go.Byte>): (go.Result<go.GoInt>);
    @:native("ReadAt") function readAt(p: go.Slice<go.Byte>, off: go.Int64): (go.Result<go.GoInt>);
    @:native("Seek") function seek(offset: go.Int64, whence: go.GoInt): (go.Result<go.Int64>);
    @:native("Size") function size(): (go.Int64);

}