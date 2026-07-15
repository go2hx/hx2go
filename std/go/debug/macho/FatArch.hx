package go.debug.macho;

@:structInit
@:go.Type({ name: "FatArch", instanceName: "macho.FatArch", imports: ["debug/macho"] })
extern class FatArch {

    @:native("FatArchHeader") var fatArchHeader: go.debug.macho.FatArchHeader;
    @:native("File") var file: go.Pointer<go.debug.macho.File>;

function new(fatArchHeader: go.debug.macho.FatArchHeader, file: go.Pointer<go.debug.macho.File>);

    @:native("Close") function close(): go.Error;
    @:native("DWARF") function DWARF(): go.Result<go.Pointer<go.debug.dwarf.Data>>;
    @:native("ImportedLibraries") function importedLibraries(): go.Result<go.Slice<String>>;
    @:native("ImportedSymbols") function importedSymbols(): go.Result<go.Slice<String>>;
    @:native("Section") function section(name: String): go.Pointer<go.debug.macho.Section>;
    @:native("Segment") function segment(name: String): go.Pointer<go.debug.macho.Segment>;

}