package go.debug.elf;

@:structInit
@:go.Type({ name: "DynamicVersion", instanceName: "elf.DynamicVersion", imports: ["debug/elf"] })
extern class DynamicVersion {

    @:native("Name") var name: String;
    @:native("Index") var index: go.UInt16;
    @:native("Flags") var flags: go.debug.elf.DynamicVersionFlag;
    @:native("Deps") var deps: go.Slice<String>;

function new(name: String, index: go.UInt16, flags: go.debug.elf.DynamicVersionFlag, deps: go.Slice<String>);

}