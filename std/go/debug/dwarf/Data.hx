package go.debug.dwarf;

/**
    Data represents the DWARF debugging information
    loaded from an executable file (for example, an ELF or Mach-O executable).
**/
@:structInit
@:go.Type({ name: "Data", instanceName: "dwarf.Data", imports: ["debug/dwarf"] })
extern class Data {

    /**
        AddSection adds another DWARF section by name. The name should be a
        DWARF section name such as ".debug_addr", ".debug_str_offsets", and
        so forth. This approach is used for new DWARF sections added in
        DWARF 5 and later.
    **/
    @:native("AddSection") function addSection(name: String, contents: go.Slice<go.Byte>): (go.Error);
    /**
        AddTypes will add one .debug_types section to the DWARF data. A
        typical object with DWARF version 4 debug info will have multiple
        .debug_types sections. The name is used for error reporting only,
        and serves to distinguish one .debug_types section from another.
    **/
    @:native("AddTypes") function addTypes(name: String, types: go.Slice<go.Byte>): (go.Error);
    /**
        LineReader returns a new reader for the line table of compilation
        unit cu, which must be an [Entry] with tag [TagCompileUnit].
        
        If this compilation unit has no line table, it returns nil, nil.
    **/
    @:native("LineReader") function lineReader(cu: go.Pointer<go.debug.dwarf.Entry>): (go.Result<go.Pointer<go.debug.dwarf.LineReader>>);
    /**
        Ranges returns the PC ranges covered by e, a slice of [low,high) pairs.
        Only some entry types, such as [TagCompileUnit] or [TagSubprogram], have PC
        ranges; for others, this will return nil with no error.
    **/
    @:native("Ranges") function ranges(e: go.Pointer<go.debug.dwarf.Entry>): (go.Result<go.Slice<go.GoArray<go.UInt64, 2>>>);
    /**
        Reader returns a new Reader for [Data].
        The reader is positioned at byte offset 0 in the DWARF “info” section.
    **/
    @:native("Reader") function reader(): (go.Pointer<go.debug.dwarf.Reader>);
    /**
        Type reads the type at off in the DWARF “info” section.
    **/
    @:native("Type") function type(off: go.debug.dwarf.Offset): (go.Result<go.debug.dwarf.Type>);

}