package go.debug.elf;

@:structInit
@:go.Type({ name: "Rel64", instanceName: "elf.Rel64", imports: ["debug/elf"] })
extern class Rel64 {

    @:native("Off") var off: go.UInt64;
    @:native("Info") var info: go.UInt64;

function new(off: go.UInt64, info: go.UInt64);

}