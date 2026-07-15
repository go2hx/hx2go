package go.debug.elf;

@:structInit
@:go.Type({ name: "Dyn64", instanceName: "elf.Dyn64", imports: ["debug/elf"] })
extern class Dyn64 {

    @:native("Tag") var tag: go.Int64;
    @:native("Val") var val: go.UInt64;

function new(tag: go.Int64, val: go.UInt64);

}