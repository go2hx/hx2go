package go.debug.elf;

/**
    ELF32 Compression header.
**/
@:structInit
@:go.Type({ name: "Chdr32", instanceName: "elf.Chdr32", imports: ["debug/elf"] })
extern class Chdr32 {

    @:native("Type") var type: go.UInt32;
    @:native("Size") var size: go.UInt32;
    @:native("Addralign") var addralign: go.UInt32;

    function new(type: go.UInt32=0, size: go.UInt32=0, addralign: go.UInt32=0);

}