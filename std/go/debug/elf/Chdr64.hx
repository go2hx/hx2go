package go.debug.elf;

@:structInit
@:go.Type({ name: "Chdr64", instanceName: "elf.Chdr64", imports: ["debug/elf"] })
extern class Chdr64 {

    @:native("Type") var type: go.UInt32;
    @:native("Size") var size: go.UInt64;
    @:native("Addralign") var addralign: go.UInt64;

function new(type: go.UInt32, size: go.UInt64, addralign: go.UInt64);

}