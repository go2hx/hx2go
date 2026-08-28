package go.debug.elf;

/**
    ELF64 relocations that don't need an addend field.
**/
@:structInit
@:go.Type({ name: "Rel64", instanceName: "elf.Rel64", imports: ["debug/elf"] })
extern class Rel64 {

    @:native("Off") var off: go.UInt64;
    @:native("Info") var info: go.UInt64;

    function new(off: go.UInt64=0, info: go.UInt64=0);

}