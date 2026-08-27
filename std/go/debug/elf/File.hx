package go.debug.elf;

@:structInit
@:go.Type({ name: "File", instanceName: "elf.File", imports: ["debug/elf"] })
extern class File {

    @:native("FileHeader") var fileHeader: go.debug.elf.FileHeader;
    @:native("Sections") var sections: go.Slice<go.Pointer<go.debug.elf.Section>>;
    @:native("Progs") var progs: go.Slice<go.Pointer<go.debug.elf.Prog>>;
    @:native("Class") var _class: go.debug.elf.Class;
    @:native("Data") var data: go.debug.elf.Data;
    @:native("Version") var version: go.debug.elf.Version;
    @:native("OSABI") var OSABI: go.debug.elf.OSABI;
    @:native("ABIVersion") var aBIVersion: go.UInt8;
    @:native("ByteOrder") var byteOrder: go.encoding.binary.ByteOrder;
    @:native("Type") var type: go.debug.elf.Type;
    @:native("Machine") var machine: go.debug.elf.Machine;
    @:native("Entry") var entry: go.UInt64;

    function new(fileHeader: go.debug.elf.FileHeader, sections: go.Slice<go.Pointer<go.debug.elf.Section>>=null, progs: go.Slice<go.Pointer<go.debug.elf.Prog>>=null);

    @:native("Close") function close(): (go.Error);
    @:native("DWARF") function DWARF(): (go.Result<go.Pointer<go.debug.dwarf.Data>>);
    @:native("DynString") function dynString(tag: go.debug.elf.DynTag): (go.Result<go.Slice<String>>);
    @:native("DynValue") function dynValue(tag: go.debug.elf.DynTag): (go.Result<go.Slice<go.UInt64>>);
    @:native("DynamicSymbols") function dynamicSymbols(): (go.Result<go.Slice<go.debug.elf.Symbol>>);
    @:native("DynamicVersionNeeds") function dynamicVersionNeeds(): (go.Result<go.Slice<go.debug.elf.DynamicVersionNeed>>);
    @:native("DynamicVersions") function dynamicVersions(): (go.Result<go.Slice<go.debug.elf.DynamicVersion>>);
    @:native("ImportedLibraries") function importedLibraries(): (go.Result<go.Slice<String>>);
    @:native("ImportedSymbols") function importedSymbols(): (go.Result<go.Slice<go.debug.elf.ImportedSymbol>>);
    @:native("Section") function section(name: String): (go.Pointer<go.debug.elf.Section>);
    @:native("SectionByType") function sectionByType(typ: go.debug.elf.SectionType): (go.Pointer<go.debug.elf.Section>);
    @:native("Symbols") function symbols(): (go.Result<go.Slice<go.debug.elf.Symbol>>);

}