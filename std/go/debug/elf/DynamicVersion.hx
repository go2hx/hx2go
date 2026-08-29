package go.debug.elf;

/**
    DynamicVersion is a version defined by a dynamic object.
    This describes entries in the ELF SHT_GNU_verdef section.
    We assume that the vd_version field is 1.
    Note that the name of the version appears here;
    it is not in the first Deps entry as it is in the ELF file.
**/
@:structInit
@:go.Type({ name: "DynamicVersion", instanceName: "elf.DynamicVersion", imports: ["debug/elf"] })
extern class DynamicVersion {

    @:native("Name") var name: String;
    @:native("Index") var index: go.UInt16;
    @:native("Flags") var flags: go.debug.elf.DynamicVersionFlag;
    @:native("Deps") var deps: go.Slice<String>;

    function new(name: String="", index: go.UInt16=0, flags: go.debug.elf.DynamicVersionFlag=cast 0, deps: go.Slice<String>=null);

}