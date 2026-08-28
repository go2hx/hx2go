package go.debug.pe;

/**
    A File represents an open PE file.
**/
@:structInit
@:go.Type({ name: "File", instanceName: "pe.File", imports: ["debug/pe"] })
extern class File {

    @:native("FileHeader") var fileHeader: go.debug.pe.FileHeader;
    @:native("OptionalHeader") var optionalHeader: Dynamic;
    @:native("Sections") var sections: go.Slice<go.Pointer<go.debug.pe.Section>>;
    @:native("Symbols") var symbols: go.Slice<go.Pointer<go.debug.pe.Symbol>>;
    @:native("COFFSymbols") var cOFFSymbols: go.Slice<go.debug.pe.COFFSymbol>;
    @:native("StringTable") var stringTable: go.debug.pe.StringTable;
    @:native("Machine") var machine: go.UInt16;
    @:native("NumberOfSections") var numberOfSections: go.UInt16;
    @:native("TimeDateStamp") var timeDateStamp: go.UInt32;
    @:native("PointerToSymbolTable") var pointerToSymbolTable: go.UInt32;
    @:native("NumberOfSymbols") var numberOfSymbols: go.UInt32;
    @:native("SizeOfOptionalHeader") var sizeOfOptionalHeader: go.UInt16;
    @:native("Characteristics") var characteristics: go.UInt16;

    function new(fileHeader: go.debug.pe.FileHeader, optionalHeader: Dynamic=null, sections: go.Slice<go.Pointer<go.debug.pe.Section>>=null, symbols: go.Slice<go.Pointer<go.debug.pe.Symbol>>=null, cOFFSymbols: go.Slice<go.debug.pe.COFFSymbol>=null, stringTable: go.debug.pe.StringTable=null);

    /**
        COFFSymbolReadSectionDefAux returns a blob of auxiliary information
        (including COMDAT info) for a section definition symbol. Here 'idx'
        is the index of a section symbol in the main [COFFSymbol] array for
        the File. Return value is a pointer to the appropriate aux symbol
        struct. For more info, see:
        
        auxiliary symbols: https://docs.microsoft.com/en-us/windows/win32/debug/pe-format#auxiliary-symbol-records
        COMDAT sections: https://docs.microsoft.com/en-us/windows/win32/debug/pe-format#comdat-sections-object-only
        auxiliary info for section definitions: https://docs.microsoft.com/en-us/windows/win32/debug/pe-format#auxiliary-format-5-section-definitions
    **/
    @:native("COFFSymbolReadSectionDefAux") function cOFFSymbolReadSectionDefAux(idx: go.GoInt): (go.Result<go.Pointer<go.debug.pe.COFFSymbolAuxFormat5>>);
    /**
        Close closes the [File].
        If the [File] was created using [NewFile] directly instead of [Open],
        Close has no effect.
    **/
    @:native("Close") function close(): (go.Error);
    @:native("DWARF") function DWARF(): (go.Result<go.Pointer<go.debug.dwarf.Data>>);
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
    @:native("ImportedSymbols") function importedSymbols(): (go.Result<go.Slice<String>>);
    /**
        Section returns the first section with the given name, or nil if no such
        section exists.
    **/
    @:native("Section") function section(name: String): (go.Pointer<go.debug.pe.Section>);

}