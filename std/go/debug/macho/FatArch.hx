package go.debug.macho;

@:structInit
@:go.Type({ name: "FatArch", instanceName: "macho.FatArch", imports: ["debug/macho"] })
extern class FatArch {

    @:native("FatArchHeader") var fatArchHeader: go.debug.macho.FatArchHeader;
    @:native("File") var file: go.Pointer<go.debug.macho.File>;
    @:native("Cpu") var cpu: go.debug.macho.Cpu;
    @:native("SubCpu") var subCpu: go.UInt32;
    @:native("Offset") var offset: go.UInt32;
    @:native("Size") var size: go.UInt32;
    @:native("Align") var align: go.UInt32;
    @:native("FileHeader") var fileHeader: go.debug.macho.FileHeader;
    @:native("ByteOrder") var byteOrder: go.encoding.binary.ByteOrder;
    @:native("Loads") var loads: go.Slice<go.debug.macho.Load>;
    @:native("Sections") var sections: go.Slice<go.Pointer<go.debug.macho.Section>>;
    @:native("Symtab") var symtab: go.Pointer<go.debug.macho.Symtab>;
    @:native("Dysymtab") var dysymtab: go.Pointer<go.debug.macho.Dysymtab>;
    @:native("Magic") var magic: go.UInt32;
    @:native("Type") var type: go.debug.macho.Type;
    @:native("Ncmd") var ncmd: go.UInt32;
    @:native("Cmdsz") var cmdsz: go.UInt32;
    @:native("Flags") var flags: go.UInt32;

    function new(fatArchHeader: go.debug.macho.FatArchHeader, file: go.Pointer<go.debug.macho.File>=null);

    @:native("Close") function close(): (go.Error);
    @:native("DWARF") function DWARF(): (go.Result<go.Pointer<go.debug.dwarf.Data>>);
    @:native("ImportedLibraries") function importedLibraries(): (go.Result<go.Slice<String>>);
    @:native("ImportedSymbols") function importedSymbols(): (go.Result<go.Slice<String>>);
    @:native("Section") function section(name: String): (go.Pointer<go.debug.macho.Section>);
    @:native("Segment") function segment(name: String): (go.Pointer<go.debug.macho.Segment>);

}