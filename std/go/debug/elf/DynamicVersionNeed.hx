package go.debug.elf;

@:structInit
@:go.Type({ name: "DynamicVersionNeed", instanceName: "elf.DynamicVersionNeed", imports: ["debug/elf"] })
extern class DynamicVersionNeed {

    @:native("Name") var name: String;
    @:native("Needs") var needs: go.Slice<go.debug.elf.DynamicVersionDep>;

function new(name: String, needs: go.Slice<go.debug.elf.DynamicVersionDep>);

}