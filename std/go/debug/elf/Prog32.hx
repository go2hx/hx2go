package go.debug.elf;

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

function new(type: go.UInt32, off: go.UInt32, vaddr: go.UInt32, paddr: go.UInt32, filesz: go.UInt32, memsz: go.UInt32, flags: go.UInt32, align: go.UInt32);

}