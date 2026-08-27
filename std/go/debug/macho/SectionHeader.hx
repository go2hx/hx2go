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

    function new(name: String="", seg: String="", addr: go.UInt64=0, size: go.UInt64=0, offset: go.UInt32=0, align: go.UInt32=0, reloff: go.UInt32=0, nreloc: go.UInt32=0, flags: go.UInt32=0);

}