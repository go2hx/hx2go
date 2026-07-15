package go.debug.macho;

@:structInit
@:go.Type({ name: "Section32", instanceName: "macho.Section32", imports: ["debug/macho"] })
extern class Section32 {

    @:native("Name") var name: go.GoArray<go.Byte, 16>;
    @:native("Seg") var seg: go.GoArray<go.Byte, 16>;
    @:native("Addr") var addr: go.UInt32;
    @:native("Size") var size: go.UInt32;
    @:native("Offset") var offset: go.UInt32;
    @:native("Align") var align: go.UInt32;
    @:native("Reloff") var reloff: go.UInt32;
    @:native("Nreloc") var nreloc: go.UInt32;
    @:native("Flags") var flags: go.UInt32;
    @:native("Reserve1") var reserve1: go.UInt32;
    @:native("Reserve2") var reserve2: go.UInt32;

function new(name: go.GoArray<go.Byte, 16>, seg: go.GoArray<go.Byte, 16>, addr: go.UInt32, size: go.UInt32, offset: go.UInt32, align: go.UInt32, reloff: go.UInt32, nreloc: go.UInt32, flags: go.UInt32, reserve1: go.UInt32, reserve2: go.UInt32);

}