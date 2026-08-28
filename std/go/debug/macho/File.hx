package go.debug.macho;

/**
    A File represents an open Mach-O file.
**/
@:structInit
@:go.Type({ name: "File", instanceName: "macho.File", imports: ["debug/macho"] })
extern class File {

    @:native("FileHeader") var fileHeader: go.debug.macho.FileHeader;
    @:native("ByteOrder") var byteOrder: go.encoding.binary.ByteOrder;
    @:native("Loads") var loads: go.Slice<go.debug.macho.Load>;
    @:native("Sections") var sections: go.Slice<go.Pointer<go.debug.macho.Section>>;
    @:native("Symtab") var symtab: go.Pointer<go.debug.macho.Symtab>;
    @:native("Dysymtab") var dysymtab: go.Pointer<go.debug.macho.Dysymtab>;
    @:native("Magic") var magic: go.UInt32;
    @:native("Cpu") var cpu: go.debug.macho.Cpu;
    @:native("SubCpu") var subCpu: go.UInt32;
    @:native("Type") var type: go.debug.macho.Type;
    @:native("Ncmd") var ncmd: go.UInt32;
    @:native("Cmdsz") var cmdsz: go.UInt32;
    @:native("Flags") var flags: go.UInt32;

    function new(fileHeader: go.debug.macho.FileHeader, byteOrder: go.encoding.binary.ByteOrder=null, loads: go.Slice<go.debug.macho.Load>=null, sections: go.Slice<go.Pointer<go.debug.macho.Section>>=null, symtab: go.Pointer<go.debug.macho.Symtab>=null, dysymtab: go.Pointer<go.debug.macho.Dysymtab>=null);

    /**
        Close closes the [File].
        If the [File] was created using [NewFile] directly instead of [Open],
        Close has no effect.
    **/
    @:native("Close") function close(): (go.Error);
    /**
        DWARF returns the DWARF debug information for the Mach-O file.
    **/
    @:native("DWARF") function DWARF(): (go.Result<go.Pointer<go.debug.dwarf.Data>>);
    /**
        ImportedLibraries returns the paths of all libraries
        referred to by the binary f that are expected to be
        linked with the binary at dynamic link time.
    **/
    @:native("ImportedLibraries") function importedLibraries(): (go.Result<go.Slice<String>>);
    /**
        ImportedSymbols returns the names of all symbols
        referred to by the binary f that are expected to be
        satisfied by other libraries at dynamic load time.
    **/
    @:native("ImportedSymbols") function importedSymbols(): (go.Result<go.Slice<String>>);
    /**
        Section returns the first section with the given name, or nil if no such
        section exists.
    **/
    @:native("Section") function section(name: String): (go.Pointer<go.debug.macho.Section>);
    /**
        Segment returns the first Segment with the given name, or nil if no such segment exists.
    **/
    @:native("Segment") function segment(name: String): (go.Pointer<go.debug.macho.Segment>);

}