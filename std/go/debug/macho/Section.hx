package go.debug.macho;

@:structInit
@:go.Type({ name: "Section", instanceName: "macho.Section", imports: ["debug/macho"] })
extern class Section {

    @:native("SectionHeader") var sectionHeader: go.debug.macho.SectionHeader;
    @:native("Relocs") var relocs: go.Slice<go.debug.macho.Reloc>;
    @:native("ReaderAt") var readerAt: go.io.ReaderAt;

function new(sectionHeader: go.debug.macho.SectionHeader, relocs: go.Slice<go.debug.macho.Reloc>, readerAt: go.io.ReaderAt);

    @:native("Data") function data(): go.Result<go.Slice<go.Byte>>;
    @:native("Open") function open(): go.io.ReadSeeker;
    @:native("ReadAt") function readAt(p: go.Slice<go.Byte>, off: go.Int64): go.Result<go.GoInt>;

}