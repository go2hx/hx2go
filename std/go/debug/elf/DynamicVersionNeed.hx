package go.debug.elf;

/**
    DynamicVersionNeed describes a shared library needed by a dynamic object,
    with a list of the versions needed from that shared library.
    This describes entries in the ELF SHT_GNU_verneed section.
    We assume that the vn_version field is 1.
**/
@:structInit
@:go.Type({ name: "DynamicVersionNeed", instanceName: "elf.DynamicVersionNeed", imports: ["debug/elf"] })
extern class DynamicVersionNeed {

    @:native("Name") var name: String;
    @:native("Needs") var needs: go.Slice<go.debug.elf.DynamicVersionDep>;

    function new(name: String="", needs: go.Slice<go.debug.elf.DynamicVersionDep>=null);

}