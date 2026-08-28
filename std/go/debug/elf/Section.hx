package go.debug.elf;

/**
    A Section represents a single section in an ELF file.
**/
@:structInit
@:go.Type({ name: "Section", instanceName: "elf.Section", imports: ["debug/elf"] })
extern class Section {

    @:native("SectionHeader") var sectionHeader: go.debug.elf.SectionHeader;
    @:native("ReaderAt") var readerAt: go.io.ReaderAt;
    @:native("Name") var name: String;
    @:native("Type") var type: go.debug.elf.SectionType;
    @:native("Flags") var flags: go.debug.elf.SectionFlag;
    @:native("Addr") var addr: go.UInt64;
    @:native("Offset") var offset: go.UInt64;
    @:native("Size") var size: go.UInt64;
    @:native("Link") var link: go.UInt32;
    @:native("Info") var info: go.UInt32;
    @:native("Addralign") var addralign: go.UInt64;
    @:native("Entsize") var entsize: go.UInt64;
    @:native("FileSize") var fileSize: go.UInt64;

    function new(sectionHeader: go.debug.elf.SectionHeader, readerAt: go.io.ReaderAt=null);

    /**
        Data reads and returns the contents of the ELF section.
        Even if the section is stored compressed in the ELF file,
        Data returns uncompressed data.
        
        For an [SHT_NOBITS] section, Data always returns a non-nil error.
    **/
    @:native("Data") function data(): (go.Result<go.Slice<go.Byte>>);
    /**
        Open returns a new ReadSeeker reading the ELF section.
        Even if the section is stored compressed in the ELF file,
        the ReadSeeker reads uncompressed data.
        
        For an [SHT_NOBITS] section, all calls to the opened reader
        will return a non-nil error.
    **/
    @:native("Open") function open(): (go.io.ReadSeeker);
    @:native("ReadAt") function readAt(p: go.Slice<go.Byte>, off: go.Int64): (go.Result<go.GoInt>);

}