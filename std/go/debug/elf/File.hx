package go.debug.elf;

@:structInit
@:go.Type({ name: "File", instanceName: "elf.File", imports: ["debug/elf"] })
extern class File {

    @:native("FileHeader") var fileHeader: go.debug.elf.FileHeader;
    @:native("Sections") var sections: go.Slice<go.Pointer<go.debug.elf.Section>>;
    @:native("Progs") var progs: go.Slice<go.Pointer<go.debug.elf.Prog>>;

function new(fileHeader: go.debug.elf.FileHeader, sections: go.Slice<go.Pointer<go.debug.elf.Section>>, progs: go.Slice<go.Pointer<go.debug.elf.Prog>>);

    @:native("Close") function close(): go.Error;
    @:native("DWARF") function DWARF(): go.Result<go.Pointer<go.debug.dwarf.Data>>;
    @:native("DynString") function dynString(tag: go.debug.elf.DynTag): go.Result<go.Slice<String>>;
    @:native("DynValue") function dynValue(tag: go.debug.elf.DynTag): go.Result<go.Slice<go.UInt64>>;
    @:native("DynamicSymbols") function dynamicSymbols(): go.Result<go.Slice<go.debug.elf.Symbol>>;
    @:native("DynamicVersionNeeds") function dynamicVersionNeeds(): go.Result<go.Slice<go.debug.elf.DynamicVersionNeed>>;
    @:native("DynamicVersions") function dynamicVersions(): go.Result<go.Slice<go.debug.elf.DynamicVersion>>;
    @:native("ImportedLibraries") function importedLibraries(): go.Result<go.Slice<String>>;
    @:native("ImportedSymbols") function importedSymbols(): go.Result<go.Slice<go.debug.elf.ImportedSymbol>>;
    @:native("Section") function section(name: String): go.Pointer<go.debug.elf.Section>;
    @:native("SectionByType") function sectionByType(typ: go.debug.elf.SectionType): go.Pointer<go.debug.elf.Section>;
    @:native("Symbols") function symbols(): go.Result<go.Slice<go.debug.elf.Symbol>>;

}