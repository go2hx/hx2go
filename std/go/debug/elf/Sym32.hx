package go.debug.elf;

@:structInit
@:go.Type({ name: "Sym32", instanceName: "elf.Sym32", imports: ["debug/elf"] })
extern class Sym32 {

    @:native("Name") var name: go.UInt32;
    @:native("Value") var value: go.UInt32;
    @:native("Size") var size: go.UInt32;
    @:native("Info") var info: go.UInt8;
    @:native("Other") var other: go.UInt8;
    @:native("Shndx") var shndx: go.UInt16;

    function new(name: go.UInt32=0, value: go.UInt32=0, size: go.UInt32=0, info: go.UInt8=0, other: go.UInt8=0, shndx: go.UInt16=0);

}