package go.debug.macho;

@:structInit
@:go.Type({ name: "SectionHeader", instanceName: "macho.SectionHeader", imports: ["debug/macho"] })
extern class SectionHeader {

    @:native("Name") var name: String;
    @:native("Seg") var seg: String;
    @:native("Addr") var addr: go.UInt64;
    @:native("Size") var size: go.UInt64;
    @:native("Offset") var offset: go.UInt32;
    @:native("Align") var align: go.UInt32;
    @:native("Reloff") var reloff: go.UInt32;
    @:native("Nreloc") var nreloc: go.UInt32;
    @:native("Flags") var flags: go.UInt32;

function new(name: String, seg: String, addr: go.UInt64, size: go.UInt64, offset: go.UInt32, align: go.UInt32, reloff: go.UInt32, nreloc: go.UInt32, flags: go.UInt32);

}