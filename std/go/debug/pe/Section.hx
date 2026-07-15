package go.debug.pe;

@:structInit
@:go.Type({ name: "Section", instanceName: "pe.Section", imports: ["debug/pe"] })
extern class Section {

    @:native("SectionHeader") var sectionHeader: go.debug.pe.SectionHeader;
    @:native("Relocs") var relocs: go.Slice<go.debug.pe.Reloc>;
    @:native("ReaderAt") var readerAt: go.io.ReaderAt;

function new(sectionHeader: go.debug.pe.SectionHeader, relocs: go.Slice<go.debug.pe.Reloc>, readerAt: go.io.ReaderAt);

    @:native("Data") function data(): go.Result<go.Slice<go.Byte>>;
    @:native("Open") function open(): go.io.ReadSeeker;
    @:native("ReadAt") function readAt(p: go.Slice<go.Byte>, off: go.Int64): go.Result<go.GoInt>;

}