package go.debug.elf;

/**
    ELF32 Program header.
**/
@:structInit
@:go.Type({ name: "Prog32", instanceName: "elf.Prog32", imports: ["debug/elf"] })
extern class Prog32 {

    @:native("Type") var type: go.UInt32;
    @:native("Off") var off: go.UInt32;
    @:native("Vaddr") var vaddr: go.UInt32;
    @:native("Paddr") var paddr: go.UInt32;
    @:native("Filesz") var filesz: go.UInt32;
    @:native("Memsz") var memsz: go.UInt32;
    @:native("Flags") var flags: go.UInt32;
    @:native("Align") var align: go.UInt32;

    function new(type: go.UInt32=0, off: go.UInt32=0, vaddr: go.UInt32=0, paddr: go.UInt32=0, filesz: go.UInt32=0, memsz: go.UInt32=0, flags: go.UInt32=0, align: go.UInt32=0);

}