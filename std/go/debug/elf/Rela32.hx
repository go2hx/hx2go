package go.debug.elf;

@:structInit
@:go.Type({ name: "Rela32", instanceName: "elf.Rela32", imports: ["debug/elf"] })
extern class Rela32 {

    @:native("Off") var off: go.UInt32;
    @:native("Info") var info: go.UInt32;
    @:native("Addend") var addend: go.Int32;

function new(off: go.UInt32, info: go.UInt32, addend: go.Int32);

}