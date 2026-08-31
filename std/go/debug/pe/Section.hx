package go.debug.pe;

/**
    Section provides access to PE COFF section.
**/
@:structInit
@:go.Type({ name: "Section", instanceName: "pe.Section", imports: ["debug/pe"] })
extern class Section {

    @:native("SectionHeader") var sectionHeader: go.debug.pe.SectionHeader;
    @:native("Relocs") var relocs: go.Slice<go.debug.pe.Reloc>;
    @:native("ReaderAt") var readerAt: go.io.ReaderAt;
    @:native("Name") var name: String;
    @:native("VirtualSize") var virtualSize: go.UInt32;
    @:native("VirtualAddress") var virtualAddress: go.UInt32;
    @:native("Size") var size: go.UInt32;
    @:native("Offset") var offset: go.UInt32;
    @:native("PointerToRelocations") var pointerToRelocations: go.UInt32;
    @:native("PointerToLineNumbers") var pointerToLineNumbers: go.UInt32;
    @:native("NumberOfRelocations") var numberOfRelocations: go.UInt16;
    @:native("NumberOfLineNumbers") var numberOfLineNumbers: go.UInt16;
    @:native("Characteristics") var characteristics: go.UInt32;

    function new(sectionHeader: go.debug.pe.SectionHeader, relocs: go.Slice<go.debug.pe.Reloc>=null, readerAt: go.io.ReaderAt=null);

    /**
        Data reads and returns the contents of the PE section s.
        
        If s.Offset is 0, the section has no contents,
        and Data will always return a non-nil error.
    **/
    @:native("Data") function data(): (go.Result<go.Slice<go.Byte>>);
    /**
        Open returns a new ReadSeeker reading the PE section s.
        
        If s.Offset is 0, the section has no contents, and all calls
        to the returned reader will return a non-nil error.
    **/
    @:native("Open") function open(): (go.io.ReadSeeker);
    @:native("ReadAt") function readAt(p: go.Slice<go.Byte>, off: go.Int64): (go.Result<go.GoInt>);

}