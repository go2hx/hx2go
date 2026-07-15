package go.debug.elf;

@:structInit
@:go.Type({ name: "Section", instanceName: "elf.Section", imports: ["debug/elf"] })
extern class Section {

    @:native("SectionHeader") var sectionHeader: go.debug.elf.SectionHeader;
    @:native("ReaderAt") var readerAt: go.io.ReaderAt;

function new(sectionHeader: go.debug.elf.SectionHeader, readerAt: go.io.ReaderAt);

    @:native("Data") function data(): go.Result<go.Slice<go.Byte>>;
    @:native("Open") function open(): go.io.ReadSeeker;
    @:native("ReadAt") function readAt(p: go.Slice<go.Byte>, off: go.Int64): go.Result<go.GoInt>;

}