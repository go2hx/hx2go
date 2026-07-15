package go.debug.elf;

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

function new(type: go.debug.elf.ProgType, flags: go.debug.elf.ProgFlag, off: go.UInt64, vaddr: go.UInt64, paddr: go.UInt64, filesz: go.UInt64, memsz: go.UInt64, align: go.UInt64);

}