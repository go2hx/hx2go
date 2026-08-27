package go.debug.macho;

@:structInit
@:go.Type({ name: "Segment", instanceName: "macho.Segment", imports: ["debug/macho"] })
extern class Segment {

    @:native("LoadBytes") var loadBytes: go.debug.macho.LoadBytes;
    @:native("SegmentHeader") var segmentHeader: go.debug.macho.SegmentHeader;
    @:native("ReaderAt") var readerAt: go.io.ReaderAt;
    @:native("Cmd") var cmd: go.debug.macho.LoadCmd;
    @:native("Len") var len: go.UInt32;
    @:native("Name") var name: String;
    @:native("Addr") var addr: go.UInt64;
    @:native("Memsz") var memsz: go.UInt64;
    @:native("Offset") var offset: go.UInt64;
    @:native("Filesz") var filesz: go.UInt64;
    @:native("Maxprot") var maxprot: go.UInt32;
    @:native("Prot") var prot: go.UInt32;
    @:native("Nsect") var nsect: go.UInt32;
    @:native("Flag") var flag: go.UInt32;

    function new(loadBytes: go.debug.macho.LoadBytes=null, segmentHeader: go.debug.macho.SegmentHeader, readerAt: go.io.ReaderAt=null);

    @:native("Data") function data(): (go.Result<go.Slice<go.Byte>>);
    @:native("Open") function open(): (go.io.ReadSeeker);
    @:native("Raw") function raw(): (go.Slice<go.Byte>);
    @:native("ReadAt") function readAt(p: go.Slice<go.Byte>, off: go.Int64): (go.Result<go.GoInt>);

}