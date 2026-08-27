package go.debug.elf;

@:structInit
@:go.Type({ name: "Prog", instanceName: "elf.Prog", imports: ["debug/elf"] })
extern class Prog {

    @:native("ProgHeader") var progHeader: go.debug.elf.ProgHeader;
    @:native("ReaderAt") var readerAt: go.io.ReaderAt;
    @:native("Type") var type: go.debug.elf.ProgType;
    @:native("Flags") var flags: go.debug.elf.ProgFlag;
    @:native("Off") var off: go.UInt64;
    @:native("Vaddr") var vaddr: go.UInt64;
    @:native("Paddr") var paddr: go.UInt64;
    @:native("Filesz") var filesz: go.UInt64;
    @:native("Memsz") var memsz: go.UInt64;
    @:native("Align") var align: go.UInt64;

    function new(progHeader: go.debug.elf.ProgHeader, readerAt: go.io.ReaderAt=null);

    @:native("Open") function open(): (go.io.ReadSeeker);
    @:native("ReadAt") function readAt(p: go.Slice<go.Byte>, off: go.Int64): (go.Result<go.GoInt>);

}