package go.debug.macho;

@:structInit
@:go.Type({ name: "File", instanceName: "macho.File", imports: ["debug/macho"] })
extern class File {

    @:native("FileHeader") var fileHeader: go.debug.macho.FileHeader;
    @:native("ByteOrder") var byteOrder: go.encoding.binary.ByteOrder;
    @:native("Loads") var loads: go.Slice<go.debug.macho.Load>;
    @:native("Sections") var sections: go.Slice<go.Pointer<go.debug.macho.Section>>;
    @:native("Symtab") var symtab: go.Pointer<go.debug.macho.Symtab>;
    @:native("Dysymtab") var dysymtab: go.Pointer<go.debug.macho.Dysymtab>;

function new(fileHeader: go.debug.macho.FileHeader, byteOrder: go.encoding.binary.ByteOrder, loads: go.Slice<go.debug.macho.Load>, sections: go.Slice<go.Pointer<go.debug.macho.Section>>, symtab: go.Pointer<go.debug.macho.Symtab>, dysymtab: go.Pointer<go.debug.macho.Dysymtab>);

    @:native("Close") function close(): go.Error;
    @:native("DWARF") function DWARF(): go.Result<go.Pointer<go.debug.dwarf.Data>>;
    @:native("ImportedLibraries") function importedLibraries(): go.Result<go.Slice<String>>;
    @:native("ImportedSymbols") function importedSymbols(): go.Result<go.Slice<String>>;
    @:native("Section") function section(name: String): go.Pointer<go.debug.macho.Section>;
    @:native("Segment") function segment(name: String): go.Pointer<go.debug.macho.Segment>;

}