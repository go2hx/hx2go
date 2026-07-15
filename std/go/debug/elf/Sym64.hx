package go.debug.elf;

@:structInit
@:go.Type({ name: "Sym64", instanceName: "elf.Sym64", imports: ["debug/elf"] })
extern class Sym64 {

    @:native("Name") var name: go.UInt32;
    @:native("Info") var info: go.UInt8;
    @:native("Other") var other: go.UInt8;
    @:native("Shndx") var shndx: go.UInt16;
    @:native("Value") var value: go.UInt64;
    @:native("Size") var size: go.UInt64;

function new(name: go.UInt32, info: go.UInt8, other: go.UInt8, shndx: go.UInt16, value: go.UInt64, size: go.UInt64);

}