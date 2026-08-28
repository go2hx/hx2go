package go.debug.plan9obj;

/**
    A Section represents a single section in a Plan 9 a.out file.
**/
@:structInit
@:go.Type({ name: "Section", instanceName: "plan9obj.Section", imports: ["debug/plan9obj"] })
extern class Section {

    @:native("SectionHeader") var sectionHeader: go.debug.plan9obj.SectionHeader;
    @:native("ReaderAt") var readerAt: go.io.ReaderAt;
    @:native("Name") var name: String;
    @:native("Size") var size: go.UInt32;
    @:native("Offset") var offset: go.UInt32;

    function new(sectionHeader: go.debug.plan9obj.SectionHeader, readerAt: go.io.ReaderAt=null);

    /**
        Data reads and returns the contents of the Plan 9 a.out section.
    **/
    @:native("Data") function data(): (go.Result<go.Slice<go.Byte>>);
    /**
        Open returns a new ReadSeeker reading the Plan 9 a.out section.
    **/
    @:native("Open") function open(): (go.io.ReadSeeker);
    @:native("ReadAt") function readAt(p: go.Slice<go.Byte>, off: go.Int64): (go.Result<go.GoInt>);

}