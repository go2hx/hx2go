package go.debug.elf;

@:structInit
@:go.Type({ name: "DynamicVersionDep", instanceName: "elf.DynamicVersionDep", imports: ["debug/elf"] })
extern class DynamicVersionDep {

    @:native("Flags") var flags: go.debug.elf.DynamicVersionFlag;
    @:native("Index") var index: go.UInt16;
    @:native("Dep") var dep: String;

    function new(flags: go.debug.elf.DynamicVersionFlag=cast 0, index: go.UInt16=0, dep: String="");

}