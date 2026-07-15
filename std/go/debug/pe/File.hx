package go.debug.pe;

@:structInit
@:go.Type({ name: "File", instanceName: "pe.File", imports: ["debug/pe"] })
extern class File {

    @:native("FileHeader") var fileHeader: go.debug.pe.FileHeader;
    @:native("OptionalHeader") var optionalHeader: Dynamic;
    @:native("Sections") var sections: go.Slice<go.Pointer<go.debug.pe.Section>>;
    @:native("Symbols") var symbols: go.Slice<go.Pointer<go.debug.pe.Symbol>>;
    @:native("COFFSymbols") var cOFFSymbols: go.Slice<go.debug.pe.COFFSymbol>;
    @:native("StringTable") var stringTable: go.debug.pe.StringTable;

function new(fileHeader: go.debug.pe.FileHeader, optionalHeader: Dynamic, sections: go.Slice<go.Pointer<go.debug.pe.Section>>, symbols: go.Slice<go.Pointer<go.debug.pe.Symbol>>, cOFFSymbols: go.Slice<go.debug.pe.COFFSymbol>, stringTable: go.debug.pe.StringTable);

    @:native("COFFSymbolReadSectionDefAux") function cOFFSymbolReadSectionDefAux(idx: go.GoInt): go.Result<go.Pointer<go.debug.pe.COFFSymbolAuxFormat5>>;
    @:native("Close") function close(): go.Error;
    @:native("DWARF") function DWARF(): go.Result<go.Pointer<go.debug.dwarf.Data>>;
    @:native("ImportedLibraries") function importedLibraries(): go.Result<go.Slice<String>>;
    @:native("ImportedSymbols") function importedSymbols(): go.Result<go.Slice<String>>;
    @:native("Section") function section(name: String): go.Pointer<go.debug.pe.Section>;

}