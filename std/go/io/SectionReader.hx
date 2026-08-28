package go.io;

/**
    SectionReader implements Read, Seek, and ReadAt on a section
    of an underlying [ReaderAt].
**/
@:structInit
@:go.Type({ name: "SectionReader", instanceName: "io.SectionReader", imports: ["io"] })
extern class SectionReader {

    /**
        Outer returns the underlying [ReaderAt] and offsets for the section.
        
        The returned values are the same that were passed to [NewSectionReader]
        when the [SectionReader] was created.
    **/
    @:go.Tuple("r", "off", "n") @:native("Outer") function outer(): (go.Tuple<{ r: go.io.ReaderAt, off: go.Int64, n: go.Int64 }>);
    @:native("Read") function read(p: go.Slice<go.Byte>): (go.Result<go.GoInt>);
    @:native("ReadAt") function readAt(p: go.Slice<go.Byte>, off: go.Int64): (go.Result<go.GoInt>);
    @:native("Seek") function seek(offset: go.Int64, whence: go.GoInt): (go.Result<go.Int64>);
    /**
        Size returns the size of the section in bytes.
    **/
    @:native("Size") function size(): (go.Int64);

}