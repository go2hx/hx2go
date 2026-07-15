package go.internal.xcoff;

@:structInit
@:go.Type({ name: "SectionHeader", instanceName: "xcoff.SectionHeader", imports: ["internal/xcoff"] })
extern class SectionHeader {

    @:native("Name") var name: String;
    @:native("VirtualAddress") var virtualAddress: go.UInt64;
    @:native("Size") var size: go.UInt64;
    @:native("Type") var type: go.UInt32;
    @:native("Relptr") var relptr: go.UInt64;
    @:native("Nreloc") var nreloc: go.UInt32;

function new(name: String, virtualAddress: go.UInt64, size: go.UInt64, type: go.UInt32, relptr: go.UInt64, nreloc: go.UInt32);

}