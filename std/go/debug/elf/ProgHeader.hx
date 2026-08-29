package go.debug.elf;

/**
    A ProgHeader represents a single ELF program header.
**/
@:structInit
@:go.Type({ name: "ProgHeader", instanceName: "elf.ProgHeader", imports: ["debug/elf"] })
extern class ProgHeader {

    @:native("Type") var type: go.debug.elf.ProgType;
    @:native("Flags") var flags: go.debug.elf.ProgFlag;
    @:native("Off") var off: go.UInt64;
    @:native("Vaddr") var vaddr: go.UInt64;
    @:native("Paddr") var paddr: go.UInt64;
    @:native("Filesz") var filesz: go.UInt64;
    @:native("Memsz") var memsz: go.UInt64;
    @:native("Align") var align: go.UInt64;

    function new(type: go.debug.elf.ProgType=cast 0, flags: go.debug.elf.ProgFlag=cast 0, off: go.UInt64=0, vaddr: go.UInt64=0, paddr: go.UInt64=0, filesz: go.UInt64=0, memsz: go.UInt64=0, align: go.UInt64=0);

}