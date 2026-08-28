package go.debug.plan9obj;

/**
    A SectionHeader represents a single Plan 9 a.out section header.
    This structure doesn't exist on-disk, but eases navigation
    through the object file.
**/
@:structInit
@:go.Type({ name: "SectionHeader", instanceName: "plan9obj.SectionHeader", imports: ["debug/plan9obj"] })
extern class SectionHeader {

    @:native("Name") var name: String;
    @:native("Size") var size: go.UInt32;
    @:native("Offset") var offset: go.UInt32;

    function new(name: String="", size: go.UInt32=0, offset: go.UInt32=0);

}