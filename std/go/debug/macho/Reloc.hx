package go.debug.macho;

@:structInit
@:go.Type({ name: "Reloc", instanceName: "macho.Reloc", imports: ["debug/macho"] })
extern class Reloc {

    @:native("Addr") var addr: go.UInt32;
    @:native("Value") var value: go.UInt32;
    @:native("Type") var type: go.UInt8;
    @:native("Len") var len: go.UInt8;
    @:native("Pcrel") var pcrel: Bool;
    @:native("Extern") var _extern: Bool;
    @:native("Scattered") var scattered: Bool;

function new(addr: go.UInt32, value: go.UInt32, type: go.UInt8, len: go.UInt8, pcrel: Bool, _extern: Bool, scattered: Bool);

}