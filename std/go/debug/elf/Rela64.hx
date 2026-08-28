package go.debug.elf;

/**
    ELF64 relocations that need an addend field.
**/
@:structInit
@:go.Type({ name: "Rela64", instanceName: "elf.Rela64", imports: ["debug/elf"] })
extern class Rela64 {

    @:native("Off") var off: go.UInt64;
    @:native("Info") var info: go.UInt64;
    @:native("Addend") var addend: go.Int64;

    function new(off: go.UInt64=0, info: go.UInt64=0, addend: go.Int64=0);

}