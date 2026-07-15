package go.debug.elf;

@:structInit
@:go.Type({ name: "Rel32", instanceName: "elf.Rel32", imports: ["debug/elf"] })
extern class Rel32 {

    @:native("Off") var off: go.UInt32;
    @:native("Info") var info: go.UInt32;

function new(off: go.UInt32, info: go.UInt32);

}