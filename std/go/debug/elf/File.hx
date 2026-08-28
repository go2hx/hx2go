package go.debug.elf;

/**
    A File represents an open ELF file.
**/
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

    /**
        Close closes the [File].
        If the [File] was created using [NewFile] directly instead of [Open],
        Close has no effect.
    **/
    @:native("Close") function close(): (go.Error);
    @:native("DWARF") function DWARF(): (go.Result<go.Pointer<go.debug.dwarf.Data>>);
    /**
        DynString returns the strings listed for the given tag in the file's dynamic
        section.
        
        The tag must be one that takes string values: [DT_NEEDED], [DT_SONAME], [DT_RPATH], or
        [DT_RUNPATH].
    **/
    @:native("DynString") function dynString(tag: go.debug.elf.DynTag): (go.Result<go.Slice<String>>);
    /**
        DynValue returns the values listed for the given tag in the file's dynamic
        section.
    **/
    @:native("DynValue") function dynValue(tag: go.debug.elf.DynTag): (go.Result<go.Slice<go.UInt64>>);
    /**
        DynamicSymbols returns the dynamic symbol table for f. The symbols
        will be listed in the order they appear in f.
        
        If f has a symbol version table, the returned [File.Symbols] will have
        initialized Version and Library fields.
        
        For compatibility with [File.Symbols], [File.DynamicSymbols] omits the null symbol at index 0.
        After retrieving the symbols as symtab, an externally supplied index x
        corresponds to symtab[x-1], not symtab[x].
    **/
    @:native("DynamicSymbols") function dynamicSymbols(): (go.Result<go.Slice<go.debug.elf.Symbol>>);
    /**
        DynamicVersionNeeds returns version dependencies for a dynamic object.
    **/
    @:native("DynamicVersionNeeds") function dynamicVersionNeeds(): (go.Result<go.Slice<go.debug.elf.DynamicVersionNeed>>);
    /**
        DynamicVersions returns version information for a dynamic object.
    **/
    @:native("DynamicVersions") function dynamicVersions(): (go.Result<go.Slice<go.debug.elf.DynamicVersion>>);
    /**
        ImportedLibraries returns the names of all libraries
        referred to by the binary f that are expected to be
        linked with the binary at dynamic link time.
    **/
    @:native("ImportedLibraries") function importedLibraries(): (go.Result<go.Slice<String>>);
    /**
        ImportedSymbols returns the names of all symbols
        referred to by the binary f that are expected to be
        satisfied by other libraries at dynamic load time.
        It does not return weak symbols.
    **/
    @:native("ImportedSymbols") function importedSymbols(): (go.Result<go.Slice<go.debug.elf.ImportedSymbol>>);
    /**
        Section returns a section with the given name, or nil if no such
        section exists.
    **/
    @:native("Section") function section(name: String): (go.Pointer<go.debug.elf.Section>);
    /**
        SectionByType returns the first section in f with the
        given type, or nil if there is no such section.
    **/
    @:native("SectionByType") function sectionByType(typ: go.debug.elf.SectionType): (go.Pointer<go.debug.elf.Section>);
    /**
        Symbols returns the symbol table for f. The symbols will be listed in the order
        they appear in f.
        
        For compatibility with Go 1.0, Symbols omits the null symbol at index 0.
        After retrieving the symbols as symtab, an externally supplied index x
        corresponds to symtab[x-1], not symtab[x].
    **/
    @:native("Symbols") function symbols(): (go.Result<go.Slice<go.debug.elf.Symbol>>);

}