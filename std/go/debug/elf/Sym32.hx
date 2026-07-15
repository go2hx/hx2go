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

function new(name: go.UInt32, value: go.UInt32, size: go.UInt32, info: go.UInt8, other: go.UInt8, shndx: go.UInt16);

}