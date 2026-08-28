package go.debug.elf;

/**
    ELF64 Program header.
**/
@:structInit
@:go.Type({ name: "Prog64", instanceName: "elf.Prog64", imports: ["debug/elf"] })
extern class Prog64 {

    @:native("Type") var type: go.UInt32;
    @:native("Flags") var flags: go.UInt32;
    @:native("Off") var off: go.UInt64;
    @:native("Vaddr") var vaddr: go.UInt64;
    @:native("Paddr") var paddr: go.UInt64;
    @:native("Filesz") var filesz: go.UInt64;
    @:native("Memsz") var memsz: go.UInt64;
    @:native("Align") var align: go.UInt64;

    function new(type: go.UInt32=0, flags: go.UInt32=0, off: go.UInt64=0, vaddr: go.UInt64=0, paddr: go.UInt64=0, filesz: go.UInt64=0, memsz: go.UInt64=0, align: go.UInt64=0);

}