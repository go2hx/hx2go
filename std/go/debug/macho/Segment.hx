package go.debug.macho;

@:structInit
@:go.Type({ name: "Segment", instanceName: "macho.Segment", imports: ["debug/macho"] })
extern class Segment {

    @:native("LoadBytes") var loadBytes: go.debug.macho.LoadBytes;
    @:native("SegmentHeader") var segmentHeader: go.debug.macho.SegmentHeader;
    @:native("ReaderAt") var readerAt: go.io.ReaderAt;

function new(loadBytes: go.debug.macho.LoadBytes, segmentHeader: go.debug.macho.SegmentHeader, readerAt: go.io.ReaderAt);

    @:native("Data") function data(): go.Result<go.Slice<go.Byte>>;
    @:native("Open") function open(): go.io.ReadSeeker;
    @:native("Raw") function raw(): go.Slice<go.Byte>;
    @:native("ReadAt") function readAt(p: go.Slice<go.Byte>, off: go.Int64): go.Result<go.GoInt>;

}