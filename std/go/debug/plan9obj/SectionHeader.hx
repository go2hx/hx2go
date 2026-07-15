package go.debug.plan9obj;

@:structInit
@:go.Type({ name: "SectionHeader", instanceName: "plan9obj.SectionHeader", imports: ["debug/plan9obj"] })
extern class SectionHeader {

    @:native("Name") var name: String;
    @:native("Size") var size: go.UInt32;
    @:native("Offset") var offset: go.UInt32;

function new(name: String, size: go.UInt32, offset: go.UInt32);

}