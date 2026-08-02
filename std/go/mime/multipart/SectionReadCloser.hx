package go.mime.multipart;

@:structInit
@:go.Type({ name: "sectionReadCloser", instanceName: "multipart.sectionReadCloser", imports: ["mime/multipart"] })
extern class SectionReadCloser {

    @:native("SectionReader") var sectionReader: go.Pointer<go.io.SectionReader>;
    @:native("Closer") var closer: go.io.Closer;

    function new(sectionReader: go.Pointer<go.io.SectionReader>, closer: go.io.Closer);

    @:native("Close") function close(): (go.Error);
    @:go.Tuple("r", "off", "n") @:native("Outer") function outer(): (go.Tuple<{ r: go.io.ReaderAt, off: go.Int64, n: go.Int64 }>);
    @:native("Read") function read(p: go.Slice<go.Byte>): (go.Result<go.GoInt>);
    @:native("ReadAt") function readAt(p: go.Slice<go.Byte>, off: go.Int64): (go.Result<go.GoInt>);
    @:native("Seek") function seek(offset: go.Int64, whence: go.GoInt): (go.Result<go.Int64>);
    @:native("Size") function size(): (go.Int64);

}