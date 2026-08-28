package go.debug.elf;

/**
    ELF64 Dynamic structure. The ".dynamic" section contains an array of them.
**/
@:structInit
@:go.Type({ name: "Dyn64", instanceName: "elf.Dyn64", imports: ["debug/elf"] })
extern class Dyn64 {

    @:native("Tag") var tag: go.Int64;
    @:native("Val") var val: go.UInt64;

    function new(tag: go.Int64=0, val: go.UInt64=0);

}