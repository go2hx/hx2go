package go.internal.xcoff;

@:structInit
@:go.Type({ name: "Section", instanceName: "xcoff.Section", imports: ["internal/xcoff"] })
extern class Section {

    @:native("SectionHeader") var sectionHeader: go.internal.xcoff.SectionHeader;
    @:native("Relocs") var relocs: go.Slice<go.internal.xcoff.Reloc>;
    @:native("ReaderAt") var readerAt: go.io.ReaderAt;

function new(sectionHeader: go.internal.xcoff.SectionHeader, relocs: go.Slice<go.internal.xcoff.Reloc>, readerAt: go.io.ReaderAt);

    @:native("Data") function data(): go.Result<go.Slice<go.Byte>>;
    @:native("ReadAt") function readAt(p: go.Slice<go.Byte>, off: go.Int64): go.Result<go.GoInt>;

}