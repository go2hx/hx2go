package go.debug.elf;

@:structInit
@:go.Type({ name: "Dyn32", instanceName: "elf.Dyn32", imports: ["debug/elf"] })
extern class Dyn32 {

    @:native("Tag") var tag: go.Int32;
    @:native("Val") var val: go.UInt32;

function new(tag: go.Int32, val: go.UInt32);

}