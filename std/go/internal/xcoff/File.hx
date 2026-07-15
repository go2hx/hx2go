package go.internal.xcoff;

@:structInit
@:go.Type({ name: "File", instanceName: "xcoff.File", imports: ["internal/xcoff"] })
extern class File {

    @:native("FileHeader") var fileHeader: go.internal.xcoff.FileHeader;
    @:native("Sections") var sections: go.Slice<go.Pointer<go.internal.xcoff.Section>>;
    @:native("Symbols") var symbols: go.Slice<go.Pointer<go.internal.xcoff.Symbol>>;
    @:native("StringTable") var stringTable: go.Slice<go.Byte>;
    @:native("LibraryPaths") var libraryPaths: go.Slice<String>;

function new(fileHeader: go.internal.xcoff.FileHeader, sections: go.Slice<go.Pointer<go.internal.xcoff.Section>>, symbols: go.Slice<go.Pointer<go.internal.xcoff.Symbol>>, stringTable: go.Slice<go.Byte>, libraryPaths: go.Slice<String>);

    @:native("CSect") function cSect(name: String): go.Slice<go.Byte>;
    @:native("Close") function close(): go.Error;
    @:native("DWARF") function DWARF(): go.Result<go.Pointer<go.debug.dwarf.Data>>;
    @:native("ImportedLibraries") function importedLibraries(): go.Result<go.Slice<String>>;
    @:native("ImportedSymbols") function importedSymbols(): go.Result<go.Slice<go.internal.xcoff.ImportedSymbol>>;
    @:native("Section") function section(name: String): go.Pointer<go.internal.xcoff.Section>;
    @:native("SectionByType") function sectionByType(typ: go.UInt32): go.Pointer<go.internal.xcoff.Section>;

}